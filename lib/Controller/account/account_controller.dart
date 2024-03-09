import 'package:get/get.dart';
import 'package:local_first/Models/AccountModels/account_model.dart';
import '../../API/api_config.dart';
import '../../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../../Utility/common_function.dart';

class AccountController extends GetxController {
  /// Account Api
  Rx<AccountModel> accountModel = AccountModel().obs;

  void accountAPICall(Map<String, dynamic> params, Function()? callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.accountApi,
      success: (dio.Response<dynamic> response) {
        accountModel.value = AccountModel.fromJson(response.data);
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
}
