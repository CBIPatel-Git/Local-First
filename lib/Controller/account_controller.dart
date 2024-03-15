import 'package:local_first/Models/AccountModels/coupon_model.dart';

import '../Models/AccountModels/account_model.dart';
import '../Models/AccountModels/my_order_model.dart';
import '../Utility/utility_export.dart';
import 'package:dio/dio.dart' as dio;

class AccountController extends GetxController {
  Rx<CouponModel> getCouponModel = CouponModel().obs;

  void getCouponAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.getCouponApi,
      success: (dio.Response<dynamic> response) {
        try {
          getCouponModel.value = CouponModel.fromJson(response.data);
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

  /// Account Api
  Rx<AccountModel> accountModel = AccountModel().obs;

  void accountAPICall(Map<String, dynamic> params, Function()? callBack, {bool? showProgress}) {
    apiServiceCall(
      serviceUrl: ApiConfig.accountApi,
      success: (dio.Response<dynamic> response) {
        try {
          accountModel.value = AccountModel.fromJson(response.data);
          if (callBack != null) {
            callBack();
          }
        } catch (e) {
          print(e);
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


  Rx<MyOrderModel> myOrderModel = MyOrderModel().obs;
  void getMyOrderApiCall(Map<String, dynamic> params, Function() callBack, {bool? showProgress}) {
    // printLog("call :: $params");
    apiServiceCall(
      serviceUrl: ApiConfig.getMyOrderApi,
      success: (dio.Response<dynamic> response) {
        try {
          myOrderModel.value = MyOrderModel.fromJson(response.data);
          callBack();
        } catch (e) {
          callBack();
          printModelLog(e);
        }
      },
      isProgressShow: showProgress ?? false,
      methodType: ApiConfig.methodGET,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }
}
