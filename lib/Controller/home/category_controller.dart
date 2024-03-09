import 'package:get/get.dart';
import 'package:local_first/Models/HomeModels/get_products_by_category_model.dart';
import 'package:local_first/Models/HomeModels/get_products_by_category_model.dart' as categoryData;

import '../../API/api_config.dart';
import '../../API/api_service_call.dart';
import 'package:dio/dio.dart' as dio;

import '../../Models/HomeModels/all_category_model.dart';
import '../../Models/HomeModels/get_product_byId_model.dart';
import '../../Utility/common_function.dart';
import '../../View/Dashboard/Home/all_category_screen.dart';

class CategoryController extends GetxController {
  /// AllCategoryApi
  AllCategoryModel allCategoryModel = AllCategoryModel();

  RxList<AllCategoryModelData> allCategoryList = <AllCategoryModelData>[].obs;

  void allCategoryAPICall(
      Map<String, dynamic> params, Function()? callBack, RxInt selectedCategory) {
    apiServiceCall(
      serviceUrl: ApiConfig.allCategoryApi,
      success: (dio.Response<dynamic> response) {
        allCategoryList.clear();
        isLoading.value = false;
        isMainLoading.value = false;
        allCategoryModel = AllCategoryModel.fromJson(response.data);
        if (allCategoryModel.data != null && allCategoryModel.data?.isNotEmpty == true) {
          allCategoryList.addAll(allCategoryModel.data as Iterable<AllCategoryModelData>);
        }
        if (callBack != null) {
          callBack();
        }
      },
      isProgressShow: false,
      methodType: ApiConfig.methodGET,
      params: params,
      error: (dio.Response<dynamic> response) {
        isLoading.value = false;
        isMainLoading.value = false;
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }

  /// GetProductsByCategoryApi

  GetProductsByCategory getProductsByCategory = GetProductsByCategory();
  RxList<categoryData.Data> getProductsByCategoryList = <categoryData.Data>[].obs;

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
          getProductsByCategoryList.clear();
          getProductsByCategory = GetProductsByCategory.fromJson(response.data);
          isMainLoading.value = false;

          getProductsByCategory.data?.forEach((element) {
            getProductsByCategoryList.add(element);
          });

          if (callBack != null) {
            callBack();
          }
        },
        error: (dio.Response<dynamic> response) {
          isMainLoading.value = false;
          showSnackBar(message: response.data["message"], title: ApiConfig.error);
        },
        isProgressShow: false,
        methodType: ApiConfig.methodGET);
  }

  ///GetProductsApi

  Rx<GetProductByIdModel> getProductByIdModel = GetProductByIdModel().obs;

  void getProductByIdAPICall(Map<String, dynamic> params, int productId, Function()? callBack) {
    apiServiceCall(
      serviceUrl: '${ApiConfig.getProductByIdApi}/$productId',
      success: (dio.Response<dynamic> response) {
        getProductByIdModel.value = GetProductByIdModel.fromJson(response.data);

        if (callBack != null) {
          callBack();
        }
      },
      isProgressShow: false,
      methodType: ApiConfig.methodGET,
      params: params,
      error: (dio.Response<dynamic> response) {
        showSnackBar(message: response.data["message"], title: ApiConfig.error);
      },
    );
  }
}
