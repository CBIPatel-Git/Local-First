import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:local_first/View/Dashboard/Home/product_details_screen.dart';
import 'package:local_first/View/Dashboard/Home/search_screen.dart';

import '../../../Utility/utility_export.dart';
import '../Store/store_detail_screen.dart';
import '../Store/store_screen.dart';
import 'all_category_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  RxBool isLoading = true.obs;
  RxBool homeData = false.obs;
  final items = [
    Image(image: imagesBanner1),
    Image(image: imagesBanner1),
    Image(image: imagesBanner1),
  ];

  // Rx<model.Data> dashboardData = <model.Data>.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kHomeController.likedOffer.clear();
    getHomeData();
  }

  void getHomeData({bool? refresh}) {
    if (kHomeController.dashboardModel.value.data != null) {
      isLoading.value = false;
    }
    if (kHomeController.dashboardModel.value.data == null || (refresh ?? false)) {
      Map<String, dynamic> params = {
        "user_id": kAuthenticationController.userId,
        "latitude": 23.026013 /*getSelectedLocationLat()*/,
        "longitude": 72.507392 /*getSelectedLocationLng()*/,
        "radius": 3
      };
      kHomeController.getDashboardAPICall(params, () {
        isLoading.value = false;
        kAccountController.accountAPICall({"user_id": kAuthenticationController.userId}, () {});
        kCartController.myCartApiCall({"user_id": kAuthenticationController.userId}, () {});
        kHomeController.getWishlistAPICall({"user_id": kAuthenticationController.userId}, () {});
      }, showProgress: refresh);
    }
  }

  Future<void> _pullRefresh() async {
    getHomeData(refresh: true);
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        bgColor: white,
        context: context,
        child: RefreshIndicator(
          onRefresh: _pullRefresh,
          child: SafeArea(
            child: Obx(() {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        height18,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image(image: iconsLocation),
                                customWidth(8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello, ${kAuthenticationController.logInModel.data?.user?.displayName}',
                                      style: AppFontStyle.blackOpenSans14W600,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'New York, USA',
                                          style: AppFontStyle.blackOpenSans12W500
                                              .copyWith(color: colorPrimary2),
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: colorPrimary2,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            commonSwitchButton(isDelivery: (value) {
                              printLog("isDelivery >> $value");
                            }),
                          ],
                        ),
                        height05,
                        commonTextField(
                            borderRadius: 100,
                            hintText: 'Search Products & store',
                            textEditingController: searchController,
                            preFixIcon: iconsSearch,
                            isReadOnly: true,
                            onTapFunction: () {
                              Get.to(() => const SearchScreen());
                            },
                            suffixIcon: SizedBox(
                              width: 70,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 28,
                                    color: colorGrey,
                                  ),
                                  Image(image: iconsFilter),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                  !isLoading.value
                      ? kHomeController.dashboardModel.value.data != null
                          ? Expanded(
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Column(
                                    children: [
                                      height05,
                                      CarouselSlider(
                                        options: CarouselOptions(
                                          autoPlay: true,
                                          aspectRatio: 2.5,
                                          enlargeCenterPage: true,
                                          viewportFraction: 0.80,
                                          disableCenter: true,
                                          onPageChanged: (index, reason) {
                                            currentIndex.value = index;
                                          },
                                        ),
                                        items: items,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: List.generate(
                                            kAuthenticationController.titles.length,
                                            (index) => Obx(() {
                                                  return customIndicator(
                                                      index: index,
                                                      currentIndex: currentIndex.value);
                                                })),
                                      ),
                                      height05,
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16),
                                        child: Column(
                                          children: [
                                            if (kHomeController.dashboardModel.value.data != null &&
                                                kHomeController.dashboardModel.value.data!
                                                    .productsCategory.isNotEmpty)
                                              Column(
                                                children: [
                                                  customHeight(12),
                                                  commonTitleRow(
                                                      title: 'Products Category',
                                                      seeAllClick: () {
                                                        // Get.to(() => const LocationAccessScreen());
                                                        Get.to(() => const AllCategoryScreen());
                                                      }),
                                                  height05,
                                                  GridView.builder(
                                                    physics: const NeverScrollableScrollPhysics(),
                                                    itemCount: kHomeController.dashboardModel.value
                                                                .data!.productsCategory.length >=
                                                            8
                                                        ? 8
                                                        : kHomeController.dashboardModel.value.data!
                                                            .productsCategory.length,
                                                    shrinkWrap: true,
                                                    gridDelegate:
                                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                                            crossAxisCount: 4, mainAxisExtent: 120),
                                                    itemBuilder: (context, index) {
                                                      return InkWell(
                                                        onTap: () {
                                                          Get.to(() => const AllCategoryScreen());
                                                        },
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment.center,
                                                          children: [
                                                            commonNetworkImage(
                                                                url: kHomeController
                                                                        .dashboardModel
                                                                        .value
                                                                        .data!
                                                                        .productsCategory[index]
                                                                        .image
                                                                        ?.src ??
                                                                    ''),
                                                            height05,
                                                            Text(
                                                              maxLines: 1,
                                                              overflow: TextOverflow.ellipsis,
                                                              textAlign: TextAlign.start,
                                                              kHomeController
                                                                      .dashboardModel
                                                                      .value
                                                                      .data!
                                                                      .productsCategory[index]
                                                                      .name ??
                                                                  '',
                                                              style:
                                                                  AppFontStyle.blackOpenSans12W500,
                                                            )
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            if (kHomeController.dashboardModel.value.data != null &&
                                                kHomeController.dashboardModel.value.data!.nearStore
                                                    .isNotEmpty)
                                              Column(
                                                children: [
                                                  customHeight(10),
                                                  commonTitleRow(
                                                      title: 'Near by store',
                                                      seeAllClick: () {
                                                        Get.to(() => const StoreScreen());
                                                      }),
                                                  height05,
                                                ],
                                              )
                                          ],
                                        ),
                                      ),
                                      if (kHomeController.dashboardModel.value.data != null &&
                                          kHomeController
                                              .dashboardModel.value.data!.nearStore.isNotEmpty)
                                        ListView.builder(
                                          itemCount: kHomeController.dashboardModel.value.data!
                                                      .nearStore.length >=
                                                  3
                                              ? 3
                                              : kHomeController
                                                  .dashboardModel.value.data!.nearStore.length,
                                          shrinkWrap: true,
                                          padding: const EdgeInsets.only(left: 10, right: 20),
                                          physics: const NeverScrollableScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return InkWell(
                                              highlightColor: white,
                                              splashColor: white,
                                              onTap: () {
                                                if (kHomeController.dashboardModel.value.data!
                                                        .nearStore[index].storeId !=
                                                    null) {
                                                  Get.to(() => StoreDetailScreen(
                                                      storeId: kHomeController.dashboardModel.value
                                                          .data!.nearStore[index].storeId!));
                                                }
                                              },
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 183,
                                                    margin: const EdgeInsets.only(
                                                        top: 7, bottom: 7, left: 10),
                                                    decoration: BoxDecoration(
                                                        border:
                                                            Border.all(color: cardBorder, width: 1),
                                                        borderRadius: BorderRadius.circular(12)),
                                                    child: Stack(
                                                      children: [
                                                        Column(
                                                          children: [
                                                            Stack(
                                                              children: [
                                                                commonNetworkImage(
                                                                  height: 120,
                                                                  width: getScreenWidth(context),
                                                                  fit: BoxFit.fitWidth,
                                                                  url: kHomeController
                                                                          .dashboardModel
                                                                          .value
                                                                          .data!
                                                                          .nearStore[index]
                                                                          .details
                                                                          ?.mobileBanner ??
                                                                      '',
                                                                ),
                                                                // const Padding(
                                                                //   padding: EdgeInsets.all(10),
                                                                //   child: Align(
                                                                //     alignment: Alignment.topRight,
                                                                //     child: Icon(
                                                                //       CupertinoIcons.heart,
                                                                //       size: 24,
                                                                //       color: white,
                                                                //     ),
                                                                //   ),
                                                                // )
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.all(10),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.start,
                                                                    children: [
                                                                      Text(
                                                                        kHomeController
                                                                                .dashboardModel
                                                                                .value
                                                                                .data!
                                                                                .nearStore[index]
                                                                                .details
                                                                                ?.vendorShopName ??
                                                                            '',
                                                                        style: AppFontStyle
                                                                            .blackOpenSans16W600,
                                                                      ),
                                                                      Row(
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment
                                                                                .center,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                        children: [
                                                                          const Icon(
                                                                            Icons.star,
                                                                            size: 17,
                                                                            color: colorPrimary,
                                                                          ),
                                                                          width05,
                                                                          Text(
                                                                            '${kHomeController.dashboardModel.value.data!.nearStore[index].details?.storeRating} (2.2K) • Delivery • ${numFormatter(kHomeController.dashboardModel.value.data!.nearStore[index].distance ?? 0)}Km',
                                                                            style: AppFontStyle
                                                                                .greyOpenSans12W400,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment.end,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Text(
                                                                        '\$0 Delivery',
                                                                        style: AppFontStyle
                                                                            .blackOpenSans12W500
                                                                            .copyWith(
                                                                                color:
                                                                                    colorPrimary2),
                                                                      ),
                                                                      height05,
                                                                      Text('Closes 10:30am',
                                                                          style: AppFontStyle
                                                                              .blackOpenSans12W400
                                                                              .copyWith(
                                                                                  color: red)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  if (index == 1)
                                                    Container(
                                                        margin: const EdgeInsets.only(top: 25),
                                                        child: Image(image: imagesOfferBanner)),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 16),
                                          child: commonTitleRow(
                                              title: 'Popular stores around you',
                                              seeAllClick: () {})),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 110,
                                    child: ListView.builder(
                                      itemCount: kHomeController.popularStoreList.length,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            Container(
                                                height: 73,
                                                width: 73,
                                                margin: const EdgeInsets.symmetric(horizontal: 5),
                                                decoration: BoxDecoration(
                                                    color: whiteF7F7F7,
                                                    borderRadius: BorderRadius.circular(100)),
                                                child: Image(
                                                  image: imagesPopularStore1,
                                                  height: 52,
                                                  width: 52,
                                                )),
                                            height05,
                                            Text(
                                              kHomeController.popularStoreList[index],
                                              style: AppFontStyle.blackOpenSans12W500,
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  height05,
                                  SizedBox(
                                    height: 160,
                                    child: ListView.builder(
                                      itemCount: 5,
                                      padding: const EdgeInsets.symmetric(horizontal: 10),
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 10),
                                          child: Image(image: imagesPopularBanner1),
                                        );
                                      },
                                    ),
                                  ),
                                  if (kHomeController.dashboardModel.value.data != null &&
                                      kHomeController
                                          .dashboardModel.value.data!.todayOffer.isNotEmpty)
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          customHeight(15),
                                          commonTitleRow(
                                              title: 'Today’s Offers', seeAllClick: () {}),
                                          customHeight(10),
                                          GridView.builder(
                                            physics: const NeverScrollableScrollPhysics(),
                                            itemCount: kHomeController.dashboardModel.value.data!
                                                        .todayOffer.length >=
                                                    4
                                                ? 4
                                                : kHomeController
                                                    .dashboardModel.value.data!.todayOffer.length,
                                            shrinkWrap: true,
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                                    crossAxisCount: 2, mainAxisExtent: 220),
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                onTap: () {
                                                  Get.to(() => ProductDetailsScreen(
                                                        productId: kHomeController.dashboardModel
                                                                .value.data!.todayOffer[index].id ??
                                                            0,
                                                      ));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: white,
                                                    borderRadius: BorderRadius.circular(12),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.2),
                                                        spreadRadius: 1,
                                                        blurRadius: 12,
                                                        offset: const Offset(
                                                            0, 0), // changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  margin: const EdgeInsets.all(5),
                                                  padding: const EdgeInsets.all(5),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          SizedBox(
                                                            height: 106,
                                                            width: getScreenWidth(context),
                                                            child: commonNetworkImage(
                                                                extraPaddingPlaceholder: 12,
                                                                url: (kHomeController
                                                                            .dashboardModel
                                                                            .value
                                                                            .data!
                                                                            .todayOffer[index]
                                                                            .images
                                                                            .isNotEmpty
                                                                        ? kHomeController
                                                                            .dashboardModel
                                                                            .value
                                                                            .data!
                                                                            .todayOffer[index]
                                                                            .images[0]
                                                                            .src
                                                                        : '') ??
                                                                    ''),
                                                            // child: ClipRRect(
                                                            //     borderRadius: BorderRadius.circular(10),
                                                            //     child: Image(
                                                            //       image: imagesTodayOffer1,
                                                            //       fit: BoxFit.cover,
                                                            //     )),
                                                          ),
                                                          Align(
                                                            alignment: Alignment.topRight,
                                                            child: StatefulBuilder(
                                                                builder: (context, setState) {
                                                              return InkWell(
                                                                onTap: () {
                                                                  Map<String, dynamic> params = {
                                                                    "user_id":
                                                                        kAuthenticationController
                                                                            .userId,
                                                                    "product_id": kHomeController
                                                                        .dashboardModel
                                                                        .value
                                                                        .data!
                                                                        .todayOffer[index]
                                                                        .id
                                                                  };
                                                                  if (kHomeController
                                                                          .dashboardModel
                                                                          .value
                                                                          .data!
                                                                          .todayOffer[index]
                                                                          .like ==
                                                                      0) {
                                                                    kHomeController
                                                                        .dashboardModel
                                                                        .value
                                                                        .data!
                                                                        .todayOffer[index]
                                                                        .like = 1;
                                                                    kHomeController
                                                                        .addToWishlistAPICall(
                                                                            params, () {});
                                                                  } else {
                                                                    kHomeController
                                                                        .dashboardModel
                                                                        .value
                                                                        .data!
                                                                        .todayOffer[index]
                                                                        .like = 0;
                                                                    kHomeController
                                                                        .removeToWishlistAPICall(
                                                                            params, () {});
                                                                  }
                                                                  setState(() {});
                                                                },
                                                                child: Container(
                                                                    width: 28,
                                                                    height: 28,
                                                                    margin:
                                                                        const EdgeInsets.all(10),
                                                                    padding:
                                                                        const EdgeInsets.all(3),
                                                                    decoration: BoxDecoration(
                                                                        color: colorPrimary,
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                100)),
                                                                    child: Icon(
                                                                        kHomeController
                                                                                    .dashboardModel
                                                                                    .value
                                                                                    .data!
                                                                                    .todayOffer[
                                                                                        index]
                                                                                    .like ==
                                                                                0
                                                                            ? CupertinoIcons.heart
                                                                            : CupertinoIcons
                                                                                .heart_fill,
                                                                        color: white)
                                                                    // child: Image(
                                                                    //   image: iconsLike,
                                                                    // ),
                                                                    ),
                                                              );
                                                            }),
                                                          )
                                                        ],
                                                      ),
                                                      height12,
                                                      Text(
                                                        kHomeController.dashboardModel.value.data!
                                                                .todayOffer[index].name ??
                                                            '',
                                                        style: AppFontStyle.blackOpenSans16W600,
                                                        maxLines: 1,
                                                        overflow: TextOverflow.ellipsis,
                                                      ),
                                                      height05,
                                                      Row(
                                                        children: [
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                            children: [
                                                              const Icon(
                                                                Icons.star,
                                                                size: 17,
                                                                color: colorPrimary,
                                                              ),
                                                              width05,
                                                              Text(
                                                                '${kHomeController.dashboardModel.value.data!.todayOffer[index].averageRating}',
                                                                style: AppFontStyle
                                                                    .blackOpenSans12W500,
                                                              ),
                                                            ],
                                                          ),
                                                          width14,
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment.center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment.center,
                                                            children: [
                                                              const Icon(
                                                                Icons.location_on_outlined,
                                                                size: 17,
                                                                color: colorPrimary,
                                                              ),
                                                              width05,
                                                              Text(
                                                                '190m',
                                                                style: AppFontStyle
                                                                    .blackOpenSans12W500,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      height05,
                                                      Row(
                                                        children: [
                                                          Text(
                                                            '\$${kHomeController.dashboardModel.value.data!.todayOffer[index].salePrice ?? 0}',
                                                            style: AppFontStyle.blackOpenSans16W700
                                                                .copyWith(color: colorPrimary2),
                                                          ),
                                                          width10,
                                                          Text(
                                                            '\$${kHomeController.dashboardModel.value.data!.todayOffer[index].regularPrice}',
                                                            style: AppFontStyle.greyOpenSans12W400
                                                                .copyWith(
                                                                    decoration:
                                                                        TextDecoration.lineThrough),
                                                          ),
                                                          const Spacer(),
                                                          InkWell(
                                                            onTap: () {
                                                              // Cart click
                                                              printLog("Cart click");
                                                            },
                                                            child: Padding(
                                                              padding: const EdgeInsets.symmetric(
                                                                  horizontal: 5),
                                                              child: Image(image: iconsCartRound),
                                                            ),
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                          // customHeight(20),
                                          // Text(
                                          //   'Pick it up for free',
                                          //   style: AppFontStyle.blackOpenSans16W600,
                                          // ),
                                          // Text(
                                          //   'Skip the fees when you order pick-up',
                                          //   style: AppFontStyle.greyOpenSans14W400,
                                          // ),
                                          // height16,
                                        ],
                                      ),
                                    ),
                                  // Image(
                                  //   fit: BoxFit.cover,
                                  //   image: imagesPickupBanner,
                                  // ),
                                  // customHeight(40),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(horizontal: 20),
                                  //   child: commonFilledButton(onTap: () {}, title: 'Show More'),
                                  // ),
                                  customHeight(75)
                                ],
                              ),
                            )
                          : Expanded(child: Center(child: noDataPlaceholder()))
                      : const Expanded(child: Center(child: CircularProgressIndicator())),
                ],
              );
            }),
          ),
        ));
  }

  Widget commonTitleRow({required String title, required Function seeAllClick}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFontStyle.blackOpenSans16W600,
        ),
        commonClickableText(
          callBack: () {
            seeAllClick();
          },
          textStyle: AppFontStyle.blackOpenSans14W500.copyWith(color: colorPrimary),
          text: 'See all',
        ),
      ],
    );
  }
}
