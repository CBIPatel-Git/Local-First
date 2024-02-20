import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart' as get_x;
import 'package:local_first/Utility/colors_utility.dart';
import 'package:local_first/View/Authentication/login_screen.dart';
import 'package:lottie/lottie.dart';

import '../Controller/authentication_controller.dart';
import '../Utility/common_function.dart';
import '../Utility/pref_constants.dart';
import '../Utility/string_utility.dart';
import 'api_config.dart';
import 'api_utility.dart';
import 'boolean_response_model.dart';

const String somethingWrong = "Something Went Wrong";
const String responseMessage = "NO RESPONSE DATA FOUND";
const String interNetMessage =
    "No internet connection, Please check your internet connection and try again later";
const String connectionTimeOutMessage =
    "Oops.. Server not working or might be in maintenance. Please Try Again Later";
const String authenticationMessage = "The session has been Expired. Please log in again.";
const String tryAgain = "Try Again";
const String logInAgain = "LogIn Again";

Map<String, dynamic>? tempParams;
FormData? tempFormData;
String? tempServiceUrl;
Function? tempSuccess;
Function? tempError;
bool? tempIsProgressShow;
bool? isTempFormData;
bool? tempIsLoading;
bool? tempIsFromLogout;
bool? tempIsHideLoader;
String? tempMethodType;

///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array

Future apiServiceCall({
  required Map<String, dynamic> params,
  required String serviceUrl,
  required Function success,
  required Function error,
  required bool isProgressShow,
  required String methodType,
  bool isFromLogout = false,
  bool? isLoading,
  bool? isHideLoader = true,
  FormData? formValues,
  Map<String, dynamic>? headers,
}) async {
  tempParams = params;
  tempServiceUrl = serviceUrl;
  tempSuccess = success;
  tempMethodType = methodType;
  tempError = error;
  tempIsProgressShow = isProgressShow;
  tempIsLoading = isLoading;
  tempIsFromLogout = isFromLogout;
  tempFormData = formValues;
  tempIsHideLoader = isHideLoader;

  if (await checkInternet()) {
    if (tempIsProgressShow != null && tempIsProgressShow!) {
      showProgressDialog();
    }

    if (tempFormData != null) {
      Map<String, dynamic> tempMap = <String, dynamic>{};
      for (var element in tempFormData!.fields) {
        tempMap[element.key] = element.value;
      }
      FormData reGenerateFormData = FormData.fromMap(tempMap);
      for (var element in tempFormData!.files) {
        reGenerateFormData.files.add(MapEntry(element.key, element.value));
      }

      tempFormData = reGenerateFormData;
    }
    Map<String, dynamic> headerParameters;
    headerParameters = {
      "Accept": "application/json",
      ApiConfig.rDeviceType: Platform.isAndroid
          ? "1"
          : Platform.isIOS
              ? "2"
              : "3",
      ApiConfig.rToken:
          ' Bearer ${getLoginAccessToken() == null && getLoginAccessToken().toString().isEmpty ? "" : getLoginAccessToken()}'
    };

    // tempParams?[ApiConfig.rDeviceToken] = getFcmToken() ?? "";

    // try {

    Response response;

    if (tempMethodType == ApiConfig.methodGET) {
      response = await APIProvider.getDio().get(tempServiceUrl!,
          queryParameters: tempParams ?? {},
          options: Options(headers: headers ?? headerParameters));
    } else if (tempMethodType == ApiConfig.methodPUT) {
      response = await APIProvider.getDio().put(tempServiceUrl!,
          data: tempParams ?? {}, options: Options(headers: headerParameters));
    } else if (tempMethodType == ApiConfig.methodDELETE) {
      response = await APIProvider.getDio().delete(tempServiceUrl!,
          data: tempParams ?? {}, options: Options(headers: headerParameters));
    } else {
      response = await APIProvider.getDio().post(tempServiceUrl!,
          data: tempFormData ?? tempParams ?? {}, options: Options(headers: headerParameters));
    }

    if (kDebugMode) {
      print('-------------------------------------------------------');
      print('-------------------------------------------------------');
      logPrint('??????????${response}');
      logPrint("connect time out ${response.requestOptions.connectTimeout}");
      logPrint("send time out ${response.requestOptions.sendTimeout}");
      logPrint("receiveTimeout time out ${response.requestOptions.receiveTimeout}");
      logPrint(getPreference.read('loginToken') ?? "");
      logPrint(tempServiceUrl);
      logPrint(tempParams ?? {});
      logPrint(headerParameters);
      print('-------------------------------------------------------');
      print('-------------------------------------------------------');
    }
    print('responseStusCode${response.statusCode}');
    if (handleResponse(response) && (response.statusCode == 200 || response.statusCode == 201)) {
      // if (tempServiceUrl == 'https://yfapi.net/v7/finance/options/AAPL') {
      //   hideProgressDialog();
      //   tempSuccess!(response);
      // }

      ///postman response Code
      BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
      if (tempIsHideLoader ?? true) {
        hideProgressDialog();
      }
      if (responseData.success ?? true) {
        tempSuccess!(response);
      } else {
        tempError!(response);
      }
    } else if (response.statusCode == 401) {
      BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
      if (tempIsHideLoader ?? true) {
        hideProgressDialog();
      }
      handleAuthentication(boolResponse: responseData);
    } else {
      //400 - Bad Request - Error Message.
      //403 - Forbidden
      //404 - Not Found
      //405 - Method Not Allowed
      //500 - Internal Server Error - Show "Something went wrong.".
      //503 - Service Unavailable

      try {
        BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
        if (tempIsHideLoader ?? true) {
          hideProgressDialog();
        }
        if (response.statusCode != 400) {
          // showErrorMessage(message: responseMessage, isRecall: true);
          tempError!(response);
        } else if (isNotEmptyString(responseData.message)) {
          logPrint(responseData.message!);
          showSnackBar(title: ApiConfig.error, message: responseData.message ?? "Please Try Again");
        }
      } catch (e) {
        if (tempIsHideLoader ?? true) {
          hideProgressDialog();
        }
      }

      // tempError!(response);
      // GeneralController.to.isLoading.value = false;
    }
    // } on DioError catch (dioError) {
    //   dioErrorCall(
    //       dioError: dioError,
    //       onCallBack: (String message, bool isRecallError) {
    //         showErrorMessage(message: message, isRecall: isRecallError);
    //       });
    //   // GeneralController.to.isLoading.value = false;
    // } catch (e) {
    //   hideProgressDialog();
    //   showErrorMessage(message: e.toString(), isRecall: false);
    //   // GeneralController.to.isLoading.value = false;
    // }
  } else {
    if (tempIsHideLoader ?? true) {
      hideProgressDialog();
    }
    showErrorMessage(message: interNetMessage, isRecall: true);
  }
}

void logPrint(dynamic logPrint) {
  if (kDebugMode) {
    // ignore: avoid_print
    print('ApiService Call Data  -----> ${logPrint ?? ""}');
  }
}

void handleAuthentication({required BooleanResponseModel boolResponse}) {
  if (!tempIsFromLogout!) {
    apiAlertDialog(
        buttonTitle: logInAgain,
        message: boolResponse.message ?? authenticationMessage,
        isShowGoBack: false,
        buttonCallBack: () {
          // clearPref();
          get_x.Get.offAll(() => const LoginScreen(),
              transition: get_x.Transition.rightToLeftWithFade);
        });
  } else {
    // clearPref();
    get_x.Get.offAll(() => const LoginScreen(), transition: get_x.Transition.rightToLeftWithFade);
  }
}

// void clearPref() {
//   setIsLogin(isLogin: false);
//   try {
//     googleSignIn.signOut();
//   } catch (e) {}
//   try {
//     auth.signOut();
//   } catch (e) {}
//   try {
//     facebookLogin.logOut();
//   } catch (e) {}
// }

int serviceCallCount = 0;

showErrorMessage({required String message, required bool isRecall, Function? callBack}) {
  serviceCallCount = 0;
  // serviceCallCount++;
  hideProgressDialog();
  apiAlertDialog(
      buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
      message: message,
      buttonCallBack: () {
        if (serviceCallCount < 3) {
          if (isRecall) {
            get_x.Get.back();
            apiServiceCall(
                params: tempParams ?? {},
                serviceUrl: tempServiceUrl!,
                success: tempSuccess!,
                error: tempError!,
                isProgressShow: tempIsProgressShow!,
                methodType: tempMethodType!,
                formValues: tempFormData,
                isFromLogout: tempIsFromLogout!,
                isHideLoader: tempIsHideLoader,
                isLoading: tempIsLoading);
          } else {
            if (callBack != null) {
              callBack();
            } else {
              get_x.Get.back(); // For redirecting to back screen
            }
          }
        } else {
          get_x.Get.back(); // For redirecting to back screen
          get_x.Get.offAll(() => const LoginScreen());
        }
      });
}

void showProgressDialog() {
  if (tempIsLoading != null) {
    tempIsLoading = true;
    // FeedListController.to.isFetching.value = true;
  }
  get_x.Get.dialog(
      // Center(
      //   child: Material(
      //     child: Container(
      //       padding: const EdgeInsets.all(10),
      //       child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           Expanded(child: Lottie.asset('assets/json/loading.json')),
      //           // const SizedBox(height: 10),
      //           // const Text("Loading..."),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),

      WillPopScope(
        onWillPop: () => Future.value(false),
        child: Container(
          color: Colors.black.withOpacity(0.1),
          child: const SpinKitFadingCircle(
            color: white,
            size: 50,
          ),
        ),
      ),
      barrierDismissible: false);
}

void hideProgressDialog() {
  if (tempIsLoading != null) {
    tempIsLoading = false;
    // FeedListController.to.isFetching.value = false;
  }
  if (((tempIsProgressShow ?? false) || (tempIsHideLoader ?? true)) && get_x.Get.isDialogOpen!) {
    // getX.Get.back();
    get_x.Get.back();
  }
}

// dioErrorCall({required DioError dioError, required Function onCallBack}) {
//   switch (dioError.type) {
//     case DioErrorType.other:
//     case DioErrorType.connectTimeout:
//       // onCallBack(connectionTimeOutMessage, false);
//       onCallBack(dioError.message, true);
//       break;
//     case DioErrorType.response:
//     case DioErrorType.cancel:
//     case DioErrorType.receiveTimeout:
//     case DioErrorType.sendTimeout:
//     default:
//       onCallBack(dioError.message, true);
//       break;
//   }
// }

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

bool handleResponse(Response response) {
  try {
    if (isNotEmptyString(response.toString())) {
      return true;
    } else {
      return false;
    }
  } catch (e) {
    return false;
  }
}

apiAlertDialog(
    {required String message,
    String? buttonTitle,
    Function? buttonCallBack,
    bool isShowGoBack = true}) {
  if (get_x.Get.isDialogOpen!) {
    get_x.Get.back();
  }
  if (!get_x.Get.isDialogOpen!) {
    get_x.Get.dialog(
      WillPopScope(
        onWillPop: () {
          return isShowGoBack ? Future.value(true) : Future.value(false);
        },
        child: CupertinoAlertDialog(
          title: const Text(appName),
          // content: Text(message),
          content: Column(
            children: [
              // Lottie.asset('assets/json/no_internet.json', height: 200),
              const CircularProgressIndicator(),
              Text(message),
              const SizedBox(height: 10),
            ],
          ),
          actions: isShowGoBack
              ? [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle) ? buttonTitle! : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        get_x.Get.back();
                      }
                    },
                  ),
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: const Text("Go Back"),
                    onPressed: () {
                      get_x.Get.back();
                      // getX.Get.back();
                    },
                  )
                ]
              : [
                  CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text(isNotEmptyString(buttonTitle) ? buttonTitle! : "Try again"),
                    onPressed: () {
                      if (buttonCallBack != null) {
                        buttonCallBack();
                      } else {
                        get_x.Get.back();
                      }
                    },
                  ),
                ],
        ),
      ),
      barrierDismissible: false,
      transitionCurve: Curves.easeInCubic,
      transitionDuration: const Duration(milliseconds: 400),
    );
  }
}
