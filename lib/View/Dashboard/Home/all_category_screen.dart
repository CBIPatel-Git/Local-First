import 'package:cached_network_image/cached_network_image.dart';
import 'package:local_first/View/Dashboard/Wishlist/wishlist_screen.dart';

import '../../../Utility/utility_export.dart';
import 'category_product_screen.dart';

class AllCategoryScreen extends StatefulWidget {
  const AllCategoryScreen({super.key});

  @override
  State<AllCategoryScreen> createState() => _AllCategoryScreenState();
}

RxBool isLoading = true.obs;
RxBool isMainLoading = true.obs;

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  RxInt selectedCategory = 0.obs;
  RxBool isButtonDisabled = true.obs;

  @override
  void initState() {
    kCategoryController.allCategoryAPICall({}, () {
      isMainLoading.value = false;
    }, selectedCategory);

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
                sufFix: appBarButton(image: iconsLike, callBack: () {
                  Get.to(() => const WishlistScreen());
                })),
            Obx(() {
              return Expanded(
                child: isMainLoading.isFalse && isLoading.isFalse
                    ? Row(
                        children: [
                          Flexible(
                              flex: 1,
                              child: kCategoryController.allCategoryList.isNotEmpty == true
                                  ? StreamBuilder<Object>(
                                      stream: selectedCategory.stream,
                                      builder: (context, snapshot) {
                                        return ListView.builder(
                                          itemCount: kCategoryController.allCategoryList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index) {
                                            return AbsorbPointer(
                                              absorbing:
                                                  selectedCategory.value == index ? true : false,
                                              child: InkWell(
                                                onTap: () {
                                                  selectedCategory.value = index;

                                                  // if (selectedCategory.value == index) {
                                                  //   isButtonDisabled.value = false;
                                                  // }

                                                  // kCategoryController.allCategoryAPICall(
                                                  //     {}, () {}, isLoading, selectedCategory);

                                                  kCategoryController
                                                      .allCategoryList[selectedCategory.value]
                                                      .child;
                                                },
                                                child: Obx(() {
                                                  return Container(
                                                    height: 85,
                                                    decoration: BoxDecoration(
                                                        color: selectedCategory.value == index
                                                            ? white
                                                            : orangeFFE5C1,
                                                        border: const Border(
                                                            bottom: BorderSide(
                                                                width: 1, color: colorPrimary))),
                                                    child: Stack(
                                                      children: [
                                                        Positioned(
                                                          top: 0,
                                                          bottom: 0,
                                                          left: 0,
                                                          right: 0,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                            children: [
                                                              CachedNetworkImage(
                                                                fit: BoxFit.cover,
                                                                height: 30,
                                                                width: 47,
                                                                imageUrl: kCategoryController
                                                                        .allCategoryList[index]
                                                                        .parent
                                                                        ?.image
                                                                        ?.src ??
                                                                    '',
                                                                errorWidget:
                                                                    (context, url, error) =>
                                                                        const Icon(
                                                                  Icons.error,
                                                                  color: Colors.grey,
                                                                ),
                                                              ),
                                                              Text(
                                                                kCategoryController
                                                                        .allCategoryList[index]
                                                                        .parent
                                                                        ?.name ??
                                                                    '',
                                                                style: AppFontStyle
                                                                    .blackOpenSans12W400,
                                                                textAlign: TextAlign.center,
                                                                overflow: TextOverflow.ellipsis,
                                                                maxLines: 2,
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
                                                                        topRight:
                                                                            Radius.circular(10),
                                                                        bottomRight:
                                                                            Radius.circular(10)))),
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
                                  : const Center(child: CircularProgressIndicator())),
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
                                  kCategoryController.allCategoryList.isNotEmpty
                                      ? Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 16),
                                          child: StreamBuilder<Object>(
                                              stream: selectedCategory.stream,
                                              builder: (context, snapshot) {
                                                return Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      (kCategoryController
                                                                  .allCategoryList[
                                                                      selectedCategory.value]
                                                                  .parent
                                                                  ?.name)
                                                              .toString()
                                                              .split(" ")
                                                              .elementAt(0),
                                                      style: AppFontStyle.blackOpenSans14W600,
                                                    ),
                                                    InkWell(
                                                      splashColor: white,
                                                      highlightColor: white,
                                                      onTap: () {
                                                        Get.to(() => CategoryProductScreen());
                                                      },
                                                      child: Container(
                                                        height: 26,
                                                        width: 26,
                                                        decoration: BoxDecoration(
                                                            color: lightOrange,
                                                            borderRadius:
                                                                BorderRadius.circular(100)),
                                                        child: const Icon(
                                                          Icons.arrow_forward_ios_rounded,
                                                          color: white,
                                                          size: 16,
                                                        ),
                                                      ),
                                                    ).marginOnly(right: 10)
                                                  ],
                                                );
                                              }),
                                        )
                                      : const SizedBox(),
                                  Expanded(
                                      child: kCategoryController
                                                  .allCategoryList[selectedCategory.value]
                                                  .child
                                                  ?.isNotEmpty ==
                                              true
                                          ? GridView.builder(
                                              shrinkWrap: true,
                                              itemCount: kCategoryController
                                                  .allCategoryList[selectedCategory.value]
                                                  .child
                                                  ?.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount: 3, mainAxisExtent: 115),
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Get.to(() => CategoryProductScreen(
                                                            productId: kCategoryController
                                                                    .allCategoryList[
                                                                        selectedCategory.value]
                                                                    .child?[index]
                                                                    ?.id ??
                                                                0));
                                                      },
                                                      child: Container(
                                                        height: 75,
                                                        width: 75,
                                                        decoration: BoxDecoration(
                                                            color: whiteF7F7F7,
                                                            borderRadius:
                                                                BorderRadius.circular(10)),
                                                        child: kCategoryController
                                                                        .allCategoryList[
                                                                            selectedCategory.value]
                                                                        .child?[index]
                                                                        ?.image !=
                                                                    null &&
                                                                kCategoryController
                                                                        .allCategoryList[
                                                                            selectedCategory.value]
                                                                        .child?[index]
                                                                        ?.image
                                                                        ?.src
                                                                        ?.isNotEmpty ==
                                                                    true
                                                            ? CachedNetworkImage(
                                                                fit: BoxFit.cover,
                                                                height: 30,
                                                                width: 47,
                                                                imageUrl: kCategoryController
                                                                        .allCategoryList[
                                                                            selectedCategory.value]
                                                                        .child?[index]
                                                                        ?.image
                                                                        ?.src ??
                                                                    '',
                                                                errorWidget:
                                                                    (context, url, error) =>
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
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: const EdgeInsets.symmetric(
                                                            vertical: 8.0),
                                                        child: Text(
                                                          kCategoryController
                                                                  .allCategoryList[
                                                                      selectedCategory.value]
                                                                  .child?[index]
                                                                  ?.name ??
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
                                          : Expanded(child: noDataPlaceHolder())),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : const Center(child: CircularProgressIndicator()),
              );
            })
          ],
        )));
  }
}
