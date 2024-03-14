import 'package:local_first/Models/HomeModels/dashboard_model.dart';

import '../../Models/CartModels/get_all_review_model.dart';
import 'package:dio/dio.dart' as dio;

import '../../Models/StoreModels/store_detail_model.dart';
import '../../Models/WishListModels/wishlist_model.dart';
import '../../Utility/utility_export.dart';

class HomeController extends GetxController {
  RxBool isDeliveryEnable = true.obs;
  RxInt currentTabIndex = 0.obs;

  RxList<int> likedOffer = <int>[].obs;

  List<String> productCategoryList = [
    'Men',
    'Women',
    'Health',
    'Bag & Travel',
    'Sports',
    'Kids',
    'Furniture',
    'Ayurvedic',
  ];

  List<String> recentSearchList = [
    'Sunflower Oil',
    'Samsung Mobile',
    'Keyboard',
    'Sunglasses',
    'Face wash',
    'Refrigerator',
    'Laptop',
  ];

  List<String> popularStoreList = [
    'Shoprite',
    'MaimoTech',
    'Neoteric',
    'Ignition',
    'ZenithLab',
    'Shoprite',
    'MaimoTech',
    'Neoteric',
    'Ignition',
    'ZenithLab',
  ];

  List<String> todayOfferList = [
    'Vegetable Combo',
    'Grossery Pack',
    'Girls Morden Tops',
    'Azithromycin 500..',
  ];

  Rx<DashboardModel> dashboardModel = DashboardModel().obs;

  void getDashboardAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.getDashboardApi,
      success: (dio.Response<dynamic> response) {
        try {
          dashboardModel.value = DashboardModel.fromJson(response.data);
          setIsLogin(isLogin: true);
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

  void addToWishlistAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.addToWishlistApi,
      success: (dio.Response<dynamic> response) {
        try {
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: false,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {
        printLog(response.data["message"]);
      },
    );
  }

  void removeToWishlistAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.removeToWishlistApi,
      success: (dio.Response<dynamic> response) {
        try {
          callBack();
        } catch (e) {
          printLog(e);
        }
      },
      isProgressShow: false,
      methodType: ApiConfig.methodPOST,
      params: params,
      error: (dio.Response<dynamic> response) {},
    );
  }

  Rx<WishlistModel> wishlistModel = WishlistModel().obs;

  void getWishlistAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.myWishlistApi,
      success: (dio.Response<dynamic> response) {
        try {
          wishlistModel.value = WishlistModel.fromJson(response.data);
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

  Rx<GetAllReviewModel> getAllReviewModel = GetAllReviewModel().obs;

  void getAllReviewAPICall(Map<String, dynamic> params, Function() callBack) {
    apiServiceCall(
      serviceUrl: ApiConfig.getAllReviewApi,
      success: (dio.Response<dynamic> response) {
        try {
          getAllReviewModel.value = GetAllReviewModel.fromJson(response.data);
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
}
