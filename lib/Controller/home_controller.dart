import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isDeliveryEnable = true.obs;

  RxList<int> likedOffer = [0].obs;

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
