import 'package:flutter/cupertino.dart';

import '../../../Utility/utility_export.dart';

class StoreDetailScreen extends StatefulWidget {
  const StoreDetailScreen({super.key});

  @override
  State<StoreDetailScreen> createState() => _StoreDetailScreenState();
}

class _StoreDetailScreenState extends State<StoreDetailScreen> {
  RxList<int> storeLikedOffer = <int>[].obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 275,
                    child: Stack(
                      children: [
                        Image(
                          image: imagesStoreDetailBanner,
                          height: 245,
                          width: getScreenWidth(context),
                          fit: BoxFit.cover,
                        ),
                        Row(
                          children: [
                            appBarButton(
                                image: iconsBackIcon,
                                callBack: () {
                                  Get.back();
                                },
                                height: 32,
                                width: 32),
                            const Spacer(),
                            appBarButton(image: iconsShare, callBack: () {}, height: 32, width: 32),
                            appBarButton(image: iconsLike, callBack: () {}, height: 32, width: 32)
                                .marginOnly(left: 8),
                            appBarButton(image: iconsMore, callBack: () {}, height: 32, width: 32)
                                .marginOnly(left: 8),
                          ],
                        ).marginOnly(top: 40).paddingSymmetric(horizontal: 16),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            height: 56,
                            width: 56,
                            decoration: BoxDecoration(
                                color: colorPrimary,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  BoxShadow(
                                    color: black.withOpacity(0.26),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: const Offset(0, 4),
                                  )
                                ],
                                border: Border.all(color: white, width: 2)),
                            child: Image(
                              image: imagesStoreProfile,
                            ),
                          ),
                        ).marginOnly(left: 20)
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height05,
                        Text(
                          'Eastern Treasures Grocery',
                          style: AppFontStyle.blackOpenSans18W700,
                        ),
                        height05,
                        Text(
                          '8502 Preston Rd. Inglewood, Maine 98380',
                          style: AppFontStyle.greyOpenSans14W400,
                        ),
                        height05,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                        height05,
                        Row(
                          children: [
                            Text(
                              'Open until 10:00 PM',
                              style: AppFontStyle.greyOpenSans12W400.copyWith(color: redLight),
                            ),
                            const Spacer(),
                            InkWell(
                                onTap: () {},
                                child: Image(
                                  image: iconsFacebook,
                                  height: 24,
                                  width: 24,
                                )).marginOnly(right: 8),
                            InkWell(
                              onTap: () {},
                              child: Image(
                                image: iconsTwitter,
                                height: 24,
                                width: 24,
                              ),
                            ).marginOnly(right: 8),
                            InkWell(
                              onTap: () {},
                              child: Image(
                                image: iconsInstagram,
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ],
                        ),
                        customHeight(24),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      itemCount: 3,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image(image: imagesStoreOfferBanner),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        height20,
                        commonTitleRow(title: 'Products Category', seeAllClick: () {}),
                        height05,
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 6,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4, childAspectRatio: getSliverGridDelegate(context)),
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
                        height20,
                        commonTitleRow(title: 'Eastern Today\'s Specials', seeAllClick: () {}),
                        height05,
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 220,
                          width: 164,
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
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.all(8),
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
                  ),
                  commonTitleRow(title: 'Oil Products', seeAllClick: () {})
                      .paddingSymmetric(horizontal: 16),
                  SizedBox(
                    height: 230,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        return Container(
                          height: 220,
                          width: 164,
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
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.all(8),
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
                  ),
                  customHeight(90)
                ],
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
