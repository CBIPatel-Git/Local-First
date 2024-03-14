import 'package:get/get.dart';

import '../API/api_config.dart';
import '../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../Models/StoreModels/store_detail_model.dart';
import '../Utility/common_function.dart';

class StoreDetailController extends GetxController {
  Rx<StoreDetailModel> storeDetailModel = StoreDetailModel().obs;

  void getStoreDetailsAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.getStoreDetailApi,
      success: (dio.Response<dynamic> response) {
        try {
          storeDetailModel.value = StoreDetailModel.fromJson(response.data);
          callBack();
        } catch (e) {
          printModelLog(e);
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
