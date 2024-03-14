import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:local_first/Models/AuthenticationModel/log_in_model.dart';
import 'package:local_first/Models/AuthenticationModel/select_location_model.dart';
import 'package:local_first/Utility/constants.dart';
import 'package:local_first/Utility/pref_constants.dart';
import 'package:local_first/Utility/utility_export.dart';

import '../API/api_config.dart';
import '../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../Models/AuthenticationModel/sign_up_model.dart';
import '../Utility/common_function.dart';

final getPreference = GetStorage();

class AuthenticationController extends GetxController {
  bool isUserRegister = false;
  bool isUserLogin = false;
  int userId = 0;

  List<String> titles = [
    'Welcome to \nLocalFirst',
    'Fast and Reliable \nDelivery',
    'Seamless Checkout, \nSecure Payments'
  ];
  List<String> descriptions = [
    'Discover a world of convenience and endless possibilities. Get ready to embark on a seamless shopping experience tailored just for you.',
    'Experience swift and dependable delivery services. Track your orders in real-time and receive updates every step of the way."',
    'Your financial security is our top priority. All transactions are encrypted and processed through secure channels to protect your sensitive information."'
  ];

  /// SIGN UP API CALL
  Rx<SignUpModel> signUpAuthenticationModel = SignUpModel().obs;

  void signUpAuthenticationAPICall(Map<String, dynamic> params, Function()? callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.signInApi,
      success: (dio.Response<dynamic> response) {
        signUpAuthenticationModel.value = SignUpModel.fromJson(response.data);
        isUserRegister = true;
        if (callBack != null) {
          callBack();
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  LogInModel logInModel = LogInModel();

  void logInApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.logInApi,
      success: (dio.Response<dynamic> response) {
        try {
          logInModel = LogInModel.fromJson(response.data);
          // setIsLogin(isLogin: true);
          setLoginAccessToken(loginToken: logInModel.data?.accessToken ?? '');
          setResponse(key: PrefConstants.userDataModelPref, loginToken: jsonEncode(response.data));
          setUserId(userId: logInModel.data?.user?.ID ?? 0);
          kAuthenticationController.userId = logInModel.data?.user?.ID ?? 0;
          isUserLogin = true;
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  void forgotPassApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.forgotPassApi,
      success: (dio.Response<dynamic> response) {
        try {
          showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  void submitOtpApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.submitOtpApi,
      success: (dio.Response<dynamic> response) {
        try {
          showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  void createNewPassApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.createNewPassApi,
      success: (dio.Response<dynamic> response) {
        try {
          showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  Rx<SelectLocationModel> selectLocationModel = SelectLocationModel().obs;

  void getLocationAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.getLocationApi,
      success: (dio.Response<dynamic> response) {
        try {
          selectLocationModel.value = SelectLocationModel.fromJson(response.data);
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodGET,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }
}
