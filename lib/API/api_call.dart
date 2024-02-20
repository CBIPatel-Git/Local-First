import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart' as get_x;
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
    "Oops.. Server not working or might be in maintenance .Please Try Again Later";
const String authenticationMessage = "The session has been Expired. Please log in again.";
const String tryAgain = "Try Again";
const String logInAgain = "LogIn Again";

///Status Code with message type array or string
// 501 : sql related err
// 401: validation array
// 201 : string error
// 400 : string error
// 200: response, string/null
// 422: array
class Api {
  Future serviceCall({
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
  }) async {
    if (await checkInternet()) {
      if (isProgressShow) {
        showProgressDialogs();
      }
      if (formValues != null) {
        Map<String, dynamic> tempMap = <String, dynamic>{};
        for (var element in formValues.fields) {
          tempMap[element.key] = element.value;
        }
        FormData reGenerateFormData = FormData.fromMap(tempMap);
        for (var element in formValues.files) {
          reGenerateFormData.files.add(MapEntry(element.key, element.value));
        }
        formValues = reGenerateFormData;
      }
      Map<String, dynamic> headerParameters;
      headerParameters = {
        "Accept": "application/json",
        ApiConfig.rDeviceType: Platform.isAndroid
            ? "1"
            : Platform.isIOS
                ? "2"
                : "3",
        ApiConfig.rToken: getPreference.read(PrefConstants.loginToken) == null &&
                getPreference.read(PrefConstants.loginToken).toString().isEmpty
            ? ""
            : getPreference.read(PrefConstants.loginToken)
      };

      // try {
      Response response;
      if (methodType == ApiConfig.methodGET) {
        response = await APIProvider.getDio()
            .get(serviceUrl, queryParameters: params, options: Options(headers: headerParameters));
      } else if (methodType == ApiConfig.methodPUT) {
        response = await APIProvider.getDio()
            .put(serviceUrl, data: params, options: Options(headers: headerParameters));
      } else if (methodType == ApiConfig.methodDELETE) {
        response = await APIProvider.getDio()
            .delete(serviceUrl, data: params, options: Options(headers: headerParameters));
      } else {
        response = await APIProvider.getDio().post(serviceUrl,
            data: formValues ?? params, options: Options(headers: headerParameters));
      }
      print('========================================');
      print(response.data.toString());
      print('========================================');
      if (kDebugMode) {
        logPrint("Bearer ${getPreference.read('token')}");
        logPrint(params);
        logPrint(response);
        logPrint(serviceUrl);
        logPrint(params);
      }
      if (handleResponse(response) && response.statusCode == 200) {
        ///postman response Code
        BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
        if (isHideLoader!) {
          hideProgressDialogs();
        }
        if (responseData.success!) {
          success(response);
        } else {
          error(response);
        }
      } else if (response.statusCode == 401) {
        BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
        if (isHideLoader!) {
          hideProgressDialogs();
        }
        handleAuthentication(boolResponse: responseData, isFromLogOut: isFromLogout);
      } else {
        //400 - Bad Request - Error Message.
        //403 - Forbidden
        //404 - Not Found
        //405 - Method Not Allowed
        //500 - Internal Server Error - Show "Something went wrong.".
        //503 - Service Unavailable

        try {
          BooleanResponseModel? responseData = BooleanResponseModel.fromJson(response.data);
          if (isHideLoader ?? true) {
            hideProgressDialogs();
          }
          if (response.statusCode != 400 && response.statusCode != 200) {
            // showErrorMessage(message: responseMessage, isRecall: true);
          } else if (responseData.success! && isNotEmptyString(responseData.message)) {
            logPrint(responseData.message!);
            showSnackBar(
                title: ApiConfig.error, message: responseData.message ?? "Please Try Again");
          }
          error(response);
          // GeneralController.to.isLoading.value = false;
        } catch (e) {
          if (isHideLoader ?? true) {
            hideProgressDialogs();
          }
        }
      }
      // } on DioError catch (dioError) {
      //   dioErrorCall(
      //       dioError: dioError,
      //       onCallBack: (String message, bool isRecallError) {
      //         showErrorMessage(
      //             message: message,
      //             callBack: () {
      //               get_x.Get.back();
      //               serviceCall(
      //                   params: params,
      //                   serviceUrl: serviceUrl,
      //                   success: success,
      //                   error: error,
      //                   isProgressShow: isProgressShow,
      //                   methodType: methodType,
      //                   formValues: formValues,
      //                   isFromLogout: isFromLogout,
      //                   isHideLoader: isHideLoader,
      //                   isLoading: isLoading);
      //             });
      //       });
      //   // GeneralController.to.isLoading.value = false;
      // } catch (e) {
      //   hideProgressDialogs();
      //   showErrorMessage(
      //       message: e.toString(),
      //       callBack: () {
      //         get_x.Get.back();
      //         serviceCall(
      //             params: params,
      //             serviceUrl: serviceUrl,
      //             success: success,
      //             error: error,
      //             isProgressShow: isProgressShow,
      //             methodType: methodType,
      //             formValues: formValues,
      //             isFromLogout: isFromLogout,
      //             isHideLoader: isHideLoader,
      //             isLoading: isLoading);
      //       });
      //   // GeneralController.to.isLoading.value = false;
      // }
    } else {
      showErrorMessage(
          message: interNetMessage,
          callBack: () {
            get_x.Get.back();
            serviceCall(
                params: params,
                serviceUrl: serviceUrl,
                success: success,
                error: error,
                isProgressShow: isProgressShow,
                methodType: methodType,
                formValues: formValues,
                isFromLogout: isFromLogout,
                isHideLoader: isHideLoader,
                isLoading: isLoading);
          });
    }
  }
}

void logPrint(dynamic logPrint) {
  if (kDebugMode) {
    // ignore: avoid_print
    print('1111 ApiService Call Data  -----> ${logPrint ?? ""}');
  }
}

void handleAuthentication({required BooleanResponseModel boolResponse, bool isFromLogOut = false}) {
  if (!isFromLogOut) {
    apiAlertDialog(
        buttonTitle: logInAgain,
        message: boolResponse.message ?? authenticationMessage,
        isShowGoBack: false,
        buttonCallBack: () {
          clearPref();
          // get_x.Get.offAll(() => const SignInScreen(), transition: get_x.Transition.rightToLeftWithFade);
        });
  } else {
    clearPref();
    // get_x.Get.offAll(() => const SignInScreen(), transition: get_x.Transition.rightToLeftWithFade);
  }
}

void clearPref() {
  setIsLogin(isLogin: false);
  try {
    // googleSignIn.signOut();
  } catch (e) {}
  try {
    // auth.signOut();
  } catch (e) {}
  try {
    // facebookLogin.logOut();
  } catch (e) {}
}

int serviceCallCount = 0;

showErrorMessage({required String message, Function? callBack}) {
  serviceCallCount = 0;
  // serviceCallCount++;
  hideProgressDialogs();
  apiAlertDialog(
      buttonTitle: serviceCallCount < 3 ? tryAgain : "Restart App",
      message: message,
      buttonCallBack: () {
        if (callBack != null) {
          callBack();
        } else {
          get_x.Get.back(); // For redirecting to back screen
        }
      });
}

void showProgressDialogs({bool isLoading = true}) {
  isLoading = true;
  // FeedListController.to.isFetching.value = true;
  // get_x.Get.dialog(
  //     WillPopScope(
  //       onWillPop: () => Future.value(false),
  //       child: Container(color: Colors.black.withOpacity(0.1), child: const CupertinoActivityIndicator()),
  //     ),
  //     barrierDismissible: false);

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
            color: Colors.white,
            size: 50,
          ),
        ),
      ),
      barrierDismissible: false);
}

void hideProgressDialogs(
    {bool isLoading = true, bool isProgressShow = true, bool isHideLoader = true}) {
  if ((isProgressShow || isHideLoader) && get_x.Get.isDialogOpen!) {
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
