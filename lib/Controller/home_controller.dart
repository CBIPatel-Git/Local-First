import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isDeliveryEnable = true.obs;

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
}
