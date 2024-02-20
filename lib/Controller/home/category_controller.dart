import 'dart:convert';

import 'package:get/get.dart';

import '../../API/api_config.dart';
import '../../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../../Models/HomeModels/all_category_model.dart';
import '../../Models/HomeModels/get_product_byId_model.dart';
import '../../Utility/common_function.dart';

class CategoryController extends GetxController {
  /// AllCategoryApi
  Rx<AllCategoryModel> allCategoryModel = AllCategoryModel().obs;

  void allCategoryAPICall(Map<String, dynamic> params, Function()? callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.allCategoryApi,
      success: (dio.Response<dynamic> response) {
        allCategoryModel.value = AllCategoryModel.fromJson(response.data);
        if (callBack != null) {
          callBack();
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

  Rx<GetProductByIdModel> getProductByIdModel = GetProductByIdModel().obs;

  void getProductByIdAPICall(Map<String, dynamic> params, int productId, Function()? callBack) {
    apiServiceCall(
      serviceUrl: '${ApiConfig.getProductByIdApi}/$productId',
      success: (dio.Response<dynamic> response) {
        try {
          getProductByIdModel.value = GetProductByIdModel.fromJson(response.data);
          if (callBack != null) {
            callBack();
          }
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
