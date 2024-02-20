import 'package:get/get.dart';
import 'package:local_first/Models/HomeModels/get_products_by_category_model.dart';
import 'package:local_first/Models/HomeModels/get_products_by_category_model.dart' as categoryModel;

import '../../API/api_config.dart';
import '../../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../../Models/HomeModels/all_category_model.dart';
import '../../Models/HomeModels/get_product_byId_model.dart';
import '../../Utility/common_function.dart';

class CategoryController extends GetxController {
  /// AllCategoryApi
  AllCategoryModel allCategoryModel = AllCategoryModel();
  RxList<AllCategoryModelDataData> allCategoryList = <AllCategoryModelDataData>[].obs;

  void allCategoryAPICall(Map<String, dynamic> params, Function()? callBack, RxBool isLoading) {
    apiServiceCall(
      serviceUrl: ApiConfig.allCategoryApi,
      success: (dio.Response<dynamic> response) {
        isLoading.value = false;
        allCategoryModel = AllCategoryModel.fromJson(response.data);

        if (allCategoryModel.data?.data != null &&
            allCategoryModel.data?.data?.isNotEmpty == true) {
          allCategoryList.clear();
          allCategoryList
              .addAll(allCategoryModel.data?.data! as Iterable<AllCategoryModelDataData>);
          print('');
        }

        if (callBack != null) {
          callBack();
        }
      },
      isProgressShow: true,
      methodType: ApiConfig.methodGET,
      params: params,
      error: (dio.Response<dynamic> response) {
        isLoading.value = false;
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  /// GetProductsByCategory
  GetProductsByCategory getProductsByCategory = GetProductsByCategory();
  RxList<categoryModel.Data> getProductsByCategoryList = <categoryModel.Data>[].obs;

  void getProductByCategoryCall(
    Map<String, dynamic> params,
    Function()? callBack,
    RxBool isMainLoading,
    int? id,
  ) {
    apiServiceCall(
        params: params,
        serviceUrl: '${ApiConfig.getProductsByCategoryApi}$id',
        success: (dio.Response<dynamic> response) {
          isMainLoading.value = false;
          getProductsByCategory = GetProductsByCategory.fromJson(response.data);
          getProductsByCategoryList.clear();
          if (getProductsByCategory.data != null &&
              getProductsByCategory.data?.isNotEmpty == true) {
            getProductsByCategoryList.addAll(getProductsByCategory.data!);
          } else {
            getProductsByCategoryList.refresh();
          }
          if (callBack != null) {
            callBack();
          }
        },
        error: (dio.Response<dynamic> response) {
          isMainLoading.value = false;
          showSnackBar(message: response.data["message"], title: ApiConfig.error);
        },
        isProgressShow: true,
        methodType: ApiConfig.methodGET);
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
