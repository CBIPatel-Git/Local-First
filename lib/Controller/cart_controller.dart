import 'package:local_first/Models/CartModels/my_cart_model.dart';

import '../Models/CartModels/shipping_address_model.dart' as shippingModel;
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
          printModelLog(e);
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
          printModelLog(e);
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
          // showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printModelLog(e);
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
  RxList<FinalCartDatum> cartItems = <FinalCartDatum>[].obs;

  void myCartApiCall(Map<String, dynamic> params, Function() callBack, {bool? showProgress}) {
    // printLog("call :: $params");
    apiServiceCall(
      serviceUrl: ApiConfig.myCartApi,
      success: (dio.Response<dynamic> response) {
        try {
          myCartModel.value = MyCartModel.fromJson(response.data);
          if (myCartModel.value.data != null) {
            cartItems.clear();
            cartItems.addAll(myCartModel.value.data!.finalCartData);
          }
          callBack();
        } catch (e) {
          printModelLog(e);
        }
      },
      isProgressShow: showProgress ?? false,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  void addAddressApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.addAddressApi,
      success: (dio.Response<dynamic> response) {
        try {
          showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printModelLog(e);
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

  void editAddressApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.editAddressApi,
      success: (dio.Response<dynamic> response) {
        try {
          showSnackBar(message: response.data["message"], title: ApiConfig.success);
          callBack();
        } catch (e) {
          printModelLog(e);
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

  Rx<shippingModel.ShippingAddressModel> shippingAddressModel = shippingModel.ShippingAddressModel().obs;
  RxList<shippingModel.Datum> shippingAddress = <shippingModel.Datum>[].obs;

  void getUserAddressApiCall(Map<String, dynamic> params, Function() callBack,
      {bool? showProgress}) {
    apiServiceCall(
      serviceUrl: ApiConfig.userAddressApi,
      success: (dio.Response<dynamic> response) {
        try {
          shippingAddressModel.value = shippingModel.ShippingAddressModel.fromJson(response.data);
          shippingAddress.clear();
          shippingAddress.addAll(shippingAddressModel.value.data ?? <shippingModel.Datum>[]);
          callBack();
        } catch (e) {
          printModelLog(e);
        }
      },
      isProgressShow: showProgress ?? true,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }
}
