import 'package:local_first/Models/CartModels/my_cart_model.dart';

import '../Utility/utility_export.dart';

import 'package:dio/dio.dart' as dio;

class CartController extends GetxController {
  void addToCartApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.addToCartApi,
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

  void removeToCartApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.removeToCartApi,
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

  void addQuantityApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.addCartQuantityApi,
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

  Rx<MyCartModel> myCartModel = MyCartModel().obs;

  void myCartApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.myCartApi,
      success: (dio.Response<dynamic> response) {
        try {
          myCartModel.value = MyCartModel.fromJson(response.data);
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
}
