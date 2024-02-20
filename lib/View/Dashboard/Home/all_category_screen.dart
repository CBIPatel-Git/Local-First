import 'package:cached_network_image/cached_network_image.dart';

import '../../../Utility/utility_export.dart';
import 'category_product_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  RxInt selectedCategory = 0.obs;
  RxBool isLoading = true.obs;
  RxBool isMainLoading = true.obs;
  RxBool isButtonDisabled = true.obs;

  @override
  void initState() {
    kCategoryController.allCategoryAPICall({}, () {
      kCategoryController.getProductByCategoryCall({}, () {
        kCategoryController.getProductsByCategoryList.refresh();
      }, isMainLoading, kCategoryController.allCategoryList[selectedCategory.value].id);
    }, isLoading);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
            child: Column(
          children: [
            commonAppBar(
                preFix: appBarButton(
                    image: iconsBackIcon,
                    callBack: () {
                      Get.back();
                    }),
                title: Text(
                  'All Category',
                  style: AppFontStyle.blackOpenSans16W600,
                ),
                sufFix: appBarButton(image: iconsLike, callBack: () {})),
            Expanded(
              child: Row(
                children: [
                  Obx(() {
                    return Flexible(
                      flex: 1,
                      child: isLoading.isFalse
                          ? StreamBuilder<Object>(
                              stream: selectedCategory.stream,
                              builder: (context, snapshot) {
                                return ListView.builder(
                                  itemCount: kCategoryController.allCategoryList.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return AbsorbPointer(
                                      absorbing: selectedCategory.value == index ? true : false,
                                      child: InkWell(
                                        onTap: () {
                                          selectedCategory.value = index;

                                          // if (selectedCategory.value == index) {
                                          //   isButtonDisabled.value = false;
                                          // }

                                          kCategoryController.getProductByCategoryCall(
                                              {},
                                              () {},
                                              isLoading,
                                              kCategoryController
                                                  .allCategoryList[selectedCategory.value].id);
                                        },
                                        child: Obx(() {
                                          return Container(
                                            height: 70,
                                            decoration: BoxDecoration(
                                                color: selectedCategory.value == index
                                                    ? white
                                                    : orangeFFE5C1,
                                                border: const Border(
                                                    bottom:
                                                        BorderSide(width: 1, color: colorPrimary))),
                                            child: Stack(
                                              children: [
                                                Center(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        height: 30,
                                                        width: 47,
                                                        imageUrl: kCategoryController
                                                                .allCategoryList[index]
                                                                .image
                                                                ?.src ??
                                                            '',
                                                        errorWidget: (context, url, error) =>
                                                            const Icon(
                                                          Icons.error,
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                      Text(
                                                        kCategoryController
                                                                .allCategoryList[index].name ??
                                                            '',
                                                        style: AppFontStyle.blackOpenSans12W400,
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                if (selectedCategory.value == index)
                                                  Align(
                                                    alignment: Alignment.centerLeft,
                                                    child: Container(
                                                        height: 50,
                                                        width: 5,
                                                        decoration: const BoxDecoration(
                                                            color: colorPrimary,
                                                            borderRadius: BorderRadius.only(
                                                                topRight: Radius.circular(10),
                                                                bottomRight: Radius.circular(10)))),
                                                  ),
                                              ],
                                            ),
                                          );
                                        }),
                                      ),
                                    );
                                  },
                                );
                              })
                          : const Center(child: CircularProgressIndicator()),
                    );
                  }),
                  Flexible(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image(
                              image: imagesMobileBanner,
                              height: 74,
                              width: getScreenWidth(context),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Mobiles',
                                  style: AppFontStyle.blackOpenSans14W600,
                                ),
                                InkWell(
                                  splashColor: white,
                                  highlightColor: white,
                                  onTap: () {
                                    Get.to(() => const CategoryProductScreen());
                                  },
                                  child: Container(
                                    height: 26,
                                    width: 26,
                                    decoration: BoxDecoration(
                                        color: lightOrange,
                                        borderRadius: BorderRadius.circular(100)),
                                    child: const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: white,
                                      size: 16,
                                    ),
                                  ),
                                ).marginOnly(right: 10)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Obx(() {
                              if (isMainLoading.isFalse) {
                                return kCategoryController.getProductsByCategoryList.isNotEmpty
                                    ? GridView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            kCategoryController.getProductsByCategoryList.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3, mainAxisExtent: 115),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                height: 75,
                                                width: 75,
                                                decoration: BoxDecoration(
                                                    color: whiteF7F7F7,
                                                    borderRadius: BorderRadius.circular(10)),
                                                child: kCategoryController
                                                                .getProductsByCategoryList[index]
                                                                .images !=
                                                            null &&
                                                        kCategoryController
                                                                .getProductsByCategoryList[index]
                                                                .images
                                                                ?.isNotEmpty ==
                                                            true
                                                    ? CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        height: 30,
                                                        width: 47,
                                                        imageUrl: kCategoryController
                                                                .getProductsByCategoryList[index]
                                                                .images?[0]
                                                                .src ??
                                                            '',
                                                        errorWidget: (context, url, error) =>
                                                            const Icon(
                                                          Icons.error,
                                                          color: Colors.grey,
                                                        ),
                                                      )
                                                    : const Icon(
                                                        Icons.not_interested,
                                                        color: Colors.grey,
                                                      ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.symmetric(vertical: 8.0),
                                                  child: Text(
                                                    kCategoryController
                                                            .getProductsByCategoryList[index]
                                                            .name ??
                                                        '',
                                                    style: AppFontStyle.blackOpenSans12W600,
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                              )
                                            ],
                                          );
                                        },
                                      )
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.not_interested,
                                            color: Colors.grey,
                                          ),
                                          height05,
                                          const Text('No Data Found')
                                        ],
                                      );
                              } else {
                                return const Center(child: CircularProgressIndicator());
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
