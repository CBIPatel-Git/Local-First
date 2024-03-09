
import '../../Models/CartModels/get_all_review_model.dart';
import 'package:dio/dio.dart' as dio;

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
