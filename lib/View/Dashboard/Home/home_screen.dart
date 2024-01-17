import 'package:flutter/cupertino.dart';
import 'package:carousel_slider/carousel_slider.dart';
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
  final items = [
    Image(image: imagesBanner1),
    Image(image: imagesBanner1),
    Image(image: imagesBanner1),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    kHomeController.likedOffer.clear();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        bgColor: white,
        context: context,
        child: SafeArea(
          child: Column(
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
                                  'Hello, Jason',
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
                          print("isDelivery >> $value");
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
              Expanded(
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
                                        index: index, currentIndex: currentIndex.value);
                                  })),
                        ),
                        height05,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              customHeight(12),
                              commonTitleRow(
                                  title: 'Products Category',
                                  seeAllClick: () {
                                    Get.to(() => const AllCategoryScreen());
                                  }),
                              height05,
                              GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: kHomeController.productCategoryList.length,
                                shrinkWrap: true,
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: getSliverGridDelegate(context)),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(7),
                                          child: Image(image: imagesProduct1)),
                                      height05,
                                      Text(
                                        kHomeController.productCategoryList[index],
                                        style: AppFontStyle.blackOpenSans12W500,
                                      )
                                    ],
                                  );
                                },
                              ),
                              customHeight(10),
                              commonTitleRow(
                                  title: 'Near by store',
                                  seeAllClick: () {
                                    Get.to(() => const StoreScreen());
                                  }),
                              height05,
                            ],
                          ),
                        ),
                        ListView.builder(
                          itemCount: 3,
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 10, right: 20),
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              highlightColor: white,
                              splashColor: white,
                              onTap: () {
                                Get.to(() => const StoreDetailScreen());
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    height: 183,
                                    margin: const EdgeInsets.only(top: 7, bottom: 7, left: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: cardBorder, width: 1),
                                        borderRadius: BorderRadius.circular(12)),
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Stack(
                                              children: [
                                                SizedBox(
                                                  height: 120,
                                                  width: getScreenWidth(context),
                                                  child: ClipRRect(
                                                      borderRadius: const BorderRadius.only(
                                                          topLeft: Radius.circular(12),
                                                          topRight: Radius.circular(12)),
                                                      child: Image(
                                                        image: imagesNearbyStore,
                                                        fit: BoxFit.cover,
                                                      )),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Align(
                                                    alignment: Alignment.topRight,
                                                    child: Icon(
                                                      CupertinoIcons.heart,
                                                      size: 24,
                                                      color: white,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'The Stylish Satchel',
                                                        style: AppFontStyle.blackOpenSans16W600,
                                                      ),
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          const Icon(
                                                            Icons.star,
                                                            size: 17,
                                                            color: colorPrimary,
                                                          ),
                                                          width05,
                                                          Text(
                                                            '4.0 (2.4K) • Delivery • 2.2Km',
                                                            style: AppFontStyle.greyOpenSans12W400,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      Text(
                                                        '\$0 Delivery',
                                                        style: AppFontStyle.blackOpenSans12W500
                                                            .copyWith(color: colorPrimary2),
                                                      ),
                                                      height05,
                                                      Text('Closes 10:30am',
                                                          style: AppFontStyle.blackOpenSans12W400
                                                              .copyWith(color: red)),
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
                            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            child: commonTitleRow(
                                title: 'Popular stores around you', seeAllClick: () {})),
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
                                      color: whiteF7F7F7, borderRadius: BorderRadius.circular(100)),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          customHeight(15),
                          commonTitleRow(title: 'Today’s Offers', seeAllClick: () {}),
                          customHeight(10),
                          GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: kHomeController.todayOfferList.length,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: getSliverGridDelegate(context)),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 12,
                                      offset: const Offset(0, 0), // changes position of shadow
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
                                          child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: imagesTodayOffer1,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Align(
                                          alignment: Alignment.topRight,
                                          child: InkWell(
                                            onTap: () {
                                              kHomeController.likedOffer.contains(index)
                                                  ? kHomeController.likedOffer.remove(index)
                                                  : kHomeController.likedOffer.add(index);
                                            },
                                            child: Container(
                                              width: 28,
                                              height: 28,
                                              margin: const EdgeInsets.all(10),
                                              padding: const EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                  color: colorPrimary,
                                                  borderRadius: BorderRadius.circular(100)),
                                              child: Obx(() {
                                                return Icon(
                                                    kHomeController.likedOffer.contains(index)
                                                        ? CupertinoIcons.heart_fill
                                                        : CupertinoIcons.heart,
                                                    color: white);
                                              }),
                                              // child: Image(
                                              //   image: iconsLike,
                                              // ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    height12,
                                    Text(
                                      kHomeController.todayOfferList[index],
                                      style: AppFontStyle.blackOpenSans16W600,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    height05,
                                    Row(
                                      children: [
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 17,
                                              color: colorPrimary,
                                            ),
                                            width05,
                                            Text(
                                              '4.9',
                                              style: AppFontStyle.blackOpenSans12W500,
                                            ),
                                          ],
                                        ),
                                        width14,
                                        Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(
                                              Icons.location_on_outlined,
                                              size: 17,
                                              color: colorPrimary,
                                            ),
                                            width05,
                                            Text(
                                              '190m',
                                              style: AppFontStyle.blackOpenSans12W500,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    height05,
                                    Row(
                                      children: [
                                        Text(
                                          '\$170',
                                          style: AppFontStyle.blackOpenSans16W700
                                              .copyWith(color: colorPrimary2),
                                        ),
                                        width10,
                                        Text(
                                          '\$190',
                                          style: AppFontStyle.greyOpenSans12W400
                                              .copyWith(decoration: TextDecoration.lineThrough),
                                        ),
                                        const Spacer(),
                                        InkWell(
                                          onTap: () {
                                            // Cart click
                                            print("Cart click");
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 5),
                                            child: Image(image: iconsCartRound),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                          customHeight(20),
                          Text(
                            'Pick it up for free',
                            style: AppFontStyle.blackOpenSans16W600,
                          ),
                          Text(
                            'Skip the fees when you order pick-up',
                            style: AppFontStyle.greyOpenSans14W400,
                          ),
                          height16,
                        ],
                      ),
                    ),
                    Image(
                      fit: BoxFit.cover,
                      image: imagesPickupBanner,
                    ),
                    customHeight(40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: commonFilledButton(onTap: () {}, title: 'Show More'),
                    ),
                    customHeight(75)
                  ],
                ),
              ),
            ],
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
