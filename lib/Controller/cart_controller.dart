import 'package:local_first/Models/CartModels/my_cart_model.dart';

import '../Models/CartModels/shipping_address_model.dart';
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

  Rx<MyCartModel> myCartModel = MyCartModel().obs;

  void myCartApiCall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.myCartApi,
      success: (dio.Response<dynamic> response) {
        try {
          myCartModel.value = MyCartModel.fromJson(response.data);
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

  Rx<ShippingAddressModel> shippingAddressModel = ShippingAddressModel().obs;
  RxList<Datum> shippingAddress = <Datum>[].obs;

  void getUserAddressApiCall(Map<String, dynamic> params, Function() callBack,
      {bool? showProgress}) {
    apiServiceCall(
      serviceUrl: ApiConfig.userAddressApi,
      success: (dio.Response<dynamic> response) {
        try {
          shippingAddressModel.value = ShippingAddressModel.fromJson(response.data);
          shippingAddress.clear();
          shippingAddress.addAll(shippingAddressModel.value.data ?? <Datum>[]);
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
