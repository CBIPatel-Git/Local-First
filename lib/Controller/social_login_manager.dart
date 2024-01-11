import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:google_sign_in/google_sign_in.dart';

///Google
f_auth.User? user;
final GoogleSignIn googleSignIn = GoogleSignIn();
f_auth.FirebaseAuth auth = f_auth.FirebaseAuth.instance;

///Facebook
///https://developers.facebook.com/docs/android/getting-started#client-token
FacebookUserProfile? profile;
var facebookLogin = FacebookLogin();


///Facebook
Future initiateFacebookLogin(Function success) async {
  // // show progress
  // showProgressDialog();
  var facebookLoginResult = await facebookLogin.logIn(permissions: [
    FacebookPermission.publicProfile,
    FacebookPermission.email,
  ]);

  switch (facebookLoginResult.status) {
    case FacebookLoginStatus.error:
    // hideProgressDialog();
      print("Error");
      break;
    case FacebookLoginStatus.cancel:
      print("CancelledByUser");
      // hideProgressDialog();
      break;
    case FacebookLoginStatus.success:


      final imageUrl = await facebookLogin.getProfileImageUrl(width: 100);
      profile = await facebookLogin.getUserProfile();
      final email = await facebookLogin.getUserEmail();
      final token = facebookLoginResult.accessToken?.token;

      final AuthCredential facebookCredential = FacebookAuthProvider.credential(token!);
      final userCredential = await auth.signInWithCredential(facebookCredential).catchError((onError) {
        print('asdasda=====>>>${onError}');
      });
      // hideProgressDialog();
      print('~~~~~> ${facebookCredential}');


      /// FACEBOOK LOGIN API CALL
      // apiServiceCall(
      //     params: {
      //       ApiConfig.rSocialLogin: 1,
      //       ApiConfig.rEmail: email,
      //       ApiConfig.rSocialLoginToken: token,
      //       ApiConfig.rSocialType: "facebook",
      //       ApiConfig.rMobile: "",
      //       ApiConfig.rName: profile?.name,
      //       ApiConfig.rFamilyName: "",
      //       ApiConfig.rProfileImage: imageUrl ?? "",
      //       ApiConfig.rSocialId: profile?.userId,
      //       ApiConfig.fcmToken: fcmToken
      //     },
      //     serviceUrl: ApiConfig.loginSignupWithSocialApi,
      //     success: (dio.Response<dynamic> response) {
      //       kAuthenticationController.loginModel.value = LoginModel.fromJson(response.data);
      //       kAuthenticationController.userModel.value = LoginModelData(user: kAuthenticationController.loginModel.value.data?.user);
      //       getPreference.write(PrefConstants.loginToken, kAuthenticationController.loginModel.value.data?.token);
      //
      //       setObject(PrefConstants.subscriptionKey, kAuthenticationController.loginModel.value.data?.user?.userPlan ?? 0);
      //       kAuthenticationController.isTrialOver.value = kAuthenticationController.loginModel.value.data?.user?.isTrialOver ?? 0;
      //       setObject(PrefConstants.isTrialOverKey, kAuthenticationController.loginModel.value.data?.user?.isTrialOver ?? 0);
      //       setObject(PrefConstants.userDetails, kAuthenticationController.loginModel.value.data?.user);
      //       setObject(PrefConstants.userFlags, kAuthenticationController.loginModel.value.data?.flag);
      //       // setIsLogin(isLogin: true);
      //
      //       // if(Get.isDialogOpen ??  false){
      //       //   Get.back();
      //       // }
      //       hideProgressDialog();
      //       success();
      //     },
      //     error: (dio.Response<dynamic> response) {
      //       hideProgressDialog();
      //       showSnackBar(message: response.data['message'], color: Colors.red);
      //     },
      //     isProgressShow: false,
      //     methodType: ApiConfig.methodPOST);

      break;
  }
}


///Google
googleAuth({required Function success, BuildContext? context}) async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    // Show progress
    // showProgressDialog();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    print('accessToken ====>>>${googleSignInAuthentication.accessToken}');

    final f_auth.AuthCredential credential = f_auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      print('====>>>${googleSignInAuthentication.idToken}');

      // final f_auth.UserCredential userCredential = await auth.signInWithCustomToken("token");
      final f_auth.UserCredential userCredential = await auth.signInWithCredential(credential);
      user = userCredential.user;

      if (user != null) {
        // hideProgressDialog();

        // String? fcmToken = await FirebaseMessaging.instance.getToken();

        print("Login success :: ${user?.email}");

        /// GOOGLE LOGIN API CALL
        /*apiServiceCall(
            params: {
              ApiConfig.rSocialLogin: 1,
              ApiConfig.rEmail: user?.email,
              ApiConfig.rSocialLoginToken: googleSignInAuthentication.accessToken,
              ApiConfig.rSocialType: "google",
              ApiConfig.rMobile: user?.phoneNumber,
              ApiConfig.rName: user?.displayName,
              ApiConfig.rProfileImage: user?.photoURL ?? "",
              ApiConfig.rSocialId: user?.uid,
              ApiConfig.fcmToken: fcmToken

              // ApiConfig.rRememberMe: "1",
            },
            serviceUrl: ApiConfig.loginSignupWithSocialApi,
            success: (dio.Response<dynamic> response) {
              kAuthenticationController.loginModel.value = LoginModel.fromJson(response.data);
              kAuthenticationController.userModel.value =
                  LoginModelData(user: kAuthenticationController.loginModel.value.data?.user);

              getPreference.write(
                  PrefConstants.loginToken, kAuthenticationController.loginModel.value.data?.token);

              setObject(PrefConstants.subscriptionKey,
                  kAuthenticationController.loginModel.value.data?.user?.userPlan ?? 0);
              kAuthenticationController.isTrialOver.value =
                  kAuthenticationController.loginModel.value.data?.user?.isTrialOver ?? 0;
              setObject(PrefConstants.isTrialOverKey,
                  kAuthenticationController.loginModel.value.data?.user?.isTrialOver ?? 0);
              setObject(
                  PrefConstants.userDetails, kAuthenticationController.loginModel.value.data?.user);
              setObject(
                  PrefConstants.userFlags, kAuthenticationController.loginModel.value.data?.flag);

              // hideProgressDialog();
              success();
              print("@@@@@@@@");
            },
            error: (dio.Response<dynamic> response) {
              // showSnackBar(message: response.data['message'], color: Colors.red);
            },
            isProgressShow: false,
            methodType: ApiConfig.methodPOST);*/
      }
    } on f_auth.FirebaseAuthException catch (e) {
      // hideProgressDialog();
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
    } catch (e) {
      // hideProgressDialog();
      print('====>>>${e.toString()}');
    }
  }
}

profileGoogleAUth({required Function success}) async {
  final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

  if (googleSignInAccount != null) {
    // Show progress
    // showProgressDialog();
    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final f_auth.AuthCredential credential = f_auth.GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    try {
      print('====>>>${googleSignInAuthentication.idToken}');

      // final f_auth.UserCredential userCredential = await auth.signInWithCustomToken("token");
      final f_auth.UserCredential userCredential = await auth.signInWithCredential(credential);
      user = userCredential.user;
      if (user != null) {
        /// GOOGLE LOGIN API CALL

        if (user != null) {
          success(user?.email);
          // hideProgressDialog();
        } else {
          print("Something went wrong. Please try again later");
          // hideProgressDialog();
        }
      }
    } on f_auth.FirebaseAuthException catch (e) {
      // hideProgressDialog();
      if (e.code == 'account-exists-with-different-credential') {
      } else if (e.code == 'invalid-credential') {}
    } catch (e) {
      // hideProgressDialog();
      print('====>>>${e.toString()}');
    }
  }
}
