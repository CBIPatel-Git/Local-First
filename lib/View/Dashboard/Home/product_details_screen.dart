import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Utility/utility_export.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  final items = [
    Image(image: imagesCategoryProduct1, height: 236, fit: BoxFit.fitHeight),
    Image(image: imagesCategoryProduct1, height: 236, fit: BoxFit.fitHeight),
    Image(image: imagesCategoryProduct1, height: 236, fit: BoxFit.fitHeight),
    Image(image: imagesCategoryProduct1, height: 236, fit: BoxFit.fitHeight),
    Image(image: imagesCategoryProduct1, height: 236, fit: BoxFit.fitHeight),
  ];

  RxList likedSimilarProduct = <int>[].obs;
  RxInt selectedColor = 0.obs;
  List<Color> colorList = [
    amber,
    blue,
    ping,
    teal,
    purple,
    darkBlue,
  ];

  RxString selectedRam = ''.obs;
  List<String> ramVariantList = [
    '4 Gb',
    '8 GB',
    '12 GB',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedColor.value = colorList.first.value;
    selectedRam.value = ramVariantList.first;
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
                      hideKeyboard(context);
                      Get.back();
                    }),
                title: SizedBox(
                  width: getScreenWidth(context) * 0.6,
                  child: commonTextField(
                      borderRadius: 100,
                      hintText: 'Search for products',
                      textEditingController: searchController,
                      preFixIcon: iconsSearch,
                      onChangedFunction: (val) {
                        print("Val >>>>> $val");
                      }),
                ),
                sufFix: Badge(
                    backgroundColor: redLight,
                    label: Text(
                      '10',
                      style: AppFontStyle.blackOpenSans12W600.copyWith(color: white, fontSize: 10),
                    ),
                    child: appBarButton(image: iconsCart, callBack: () {})),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      height10,
                      SizedBox(
                        height: 236,
                        child: Stack(
                          children: [
                            CarouselSlider(
                              options: CarouselOptions(
                                autoPlay: true,
                                enlargeCenterPage: true,
                                viewportFraction: 0.80,
                                disableCenter: true,
                                height: 236,
                                onPageChanged: (index, reason) {
                                  currentIndex.value = index;
                                },
                              ),
                              items: items,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Column(
                                children: [
                                  appBarButton(
                                      image: iconsLike,
                                      iconColor: black,
                                      callBack: () {},
                                      height: 28,
                                      width: 28,
                                      iconPadding: 4),
                                  customHeight(8),
                                  appBarButton(
                                      image: iconsShare,
                                      iconColor: black,
                                      callBack: () {},
                                      height: 28,
                                      width: 28,
                                      iconPadding: 4),
                                ],
                              ).paddingOnly(right: 25),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            items.length,
                            (index) => Obx(() {
                                  return customIndicator(
                                      index: index, currentIndex: currentIndex.value);
                                })),
                      ).paddingSymmetric(vertical: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SAMSUNG Galaxy M14 5G (Icy Silver, 128 GB) (6 GB RAM)',
                              style: AppFontStyle.blackOpenSans18W700,
                            ),
                            RatingBar.builder(
                              initialRating: 4,
                              minRating: 1,
                              itemSize: 15,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ).paddingSymmetric(vertical: 10),
                            Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '\$299,43',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFontStyle.blackOpenSans20W600
                                        .copyWith(fontWeight: FontWeight.w700, color: colorPrimary),
                                  ).paddingOnly(right: 10),
                                ),
                                Flexible(
                                  child: Text(
                                    '\$30,000',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFontStyle.greyOpenSans20W500.copyWith(
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.lineThrough),
                                  ).paddingOnly(right: 10),
                                ),
                                Flexible(
                                  child: Text(
                                    '(Extra \$3583 off)',
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFontStyle.blackOpenSans14W500.copyWith(color: green),
                                  ),
                                ),
                              ],
                            ),
                            height20,
                            Text(
                              'Select Color',
                              style: AppFontStyle.blackOpenSans14W700,
                            ),
                            height12,
                            Row(
                              children: colorList
                                  .map((e) => Obx(() {
                                        return InkWell(
                                          splashColor: white,
                                          highlightColor: white,
                                          onTap: () {
                                            print('>>>>>>>>>>> ${e.value}');
                                            selectedColor.value = e.value;
                                          },
                                          child: Stack(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
                                                decoration: BoxDecoration(
                                                    color: e,
                                                    borderRadius: BorderRadius.circular(100)),
                                              ),
                                              if (selectedColor.value == e.value)
                                                Positioned(
                                                  top: 0,
                                                  left: 0,
                                                  right: 0,
                                                  bottom: 0,
                                                  child: Container(
                                                    height: 16,
                                                    width: 16,
                                                    margin: const EdgeInsets.all(7),
                                                    decoration: BoxDecoration(
                                                        color: white,
                                                        borderRadius: BorderRadius.circular(100)),
                                                  ),
                                                )
                                            ],
                                          ),
                                        );
                                      }).paddingOnly(right: 10))
                                  .toList(),
                            ),
                            height20,
                            Text(
                              'Select RAM',
                              style: AppFontStyle.blackOpenSans14W700,
                            ),
                            height12,
                            SizedBox(
                              height: 40,
                              child: Row(
                                children: ramVariantList
                                    .map((e) => InkWell(
                                          splashColor: white,
                                          highlightColor: white,
                                          onTap: () {
                                            selectedRam.value = e;
                                          },
                                          child: Obx(() {
                                            return Container(
                                              height: 38,
                                              padding: const EdgeInsets.symmetric(horizontal: 16),
                                              decoration: BoxDecoration(
                                                  color: selectedRam.value == e
                                                      ? colorPrimary2
                                                      : white,
                                                  borderRadius: BorderRadius.circular(100),
                                                  border: Border.all(
                                                      color: selectedRam.value == e
                                                          ? colorPrimary2
                                                          : cardBorder,
                                                      width: 1)),
                                              child: Center(
                                                child: Text(
                                                  e,
                                                  style: AppFontStyle.blackOpenSans14W500.copyWith(
                                                      fontSize: 15,
                                                      color: selectedRam.value == e
                                                          ? white
                                                          : textColor),
                                                ),
                                              ),
                                            );
                                          }),
                                        ).paddingOnly(right: 10))
                                    .toList(),
                              ),
                            ),
                            height20,
                            Text(
                              'Specification',
                              style: AppFontStyle.blackOpenSans14W700,
                            ),
                            height12,
                            Row(
                              children: [
                                Expanded(
                                  child: commonIconTextButton(
                                          bgColor: colorPrimary2,
                                          icon: Image(
                                            image: iconsCart,
                                            color: white,
                                          ),
                                          title: 'Add to Cart',
                                          callBack: () {})
                                      .marginSymmetric(horizontal: 5),
                                ),
                                Expanded(
                                  child: commonIconTextButton(title: 'Buy Now', callBack: () {})
                                      .marginSymmetric(horizontal: 5),
                                ),
                              ],
                            ),
                            height20,
                            commonProductDetailsRow(title: 'Model Name', subTitle: 'Galaxy M14 5G'),
                            commonProductDetailsRow(title: 'Color', subTitle: 'Icy Silver'),
                            commonProductDetailsRow(title: 'Browse Type', subTitle: 'Smartphones'),
                            commonProductDetailsRow(title: 'SIM Type', subTitle: 'Dual Sim'),
                            commonProductDetailsRow(title: 'Hybrid Sim Slot', subTitle: 'No'),
                            height18,
                            Text(
                              'Description',
                              style: AppFontStyle.blackOpenSans14W700,
                            ),
                            height12,
                            Text(
                              '16.72 centimeters (6.6-inch) LCD, FHD+ resolution with 1080 x 2408 pixels resolution, 401 PPI with 16M color 50MP+2MP+2MP Triple camera setup- True 50MP (F1.8) main camera + 2MP (F2.4) + 2MP (F2.4)| 13MP (F2.0) front camera Superfast 5G with 13 5G Bands, Powerful Exynos 1330 Octa Core 2.4GH 5nm processor with Letest Android 13,One UI Core 5.0, 6000mAH lithium-ion battery, 1 year manufacturer warranty for device and 6 months manufacturer warranty Samsung Galaxy M14 5G.',
                              style: AppFontStyle.greyOpenSans12W400,
                            ),
                            height20,
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Review Product',
                                  style: AppFontStyle.blackOpenSans14W700,
                                ),
                                commonClickableText(
                                  callBack: () {},
                                  textStyle: AppFontStyle.blackOpenSans14W500
                                      .copyWith(color: colorPrimary2),
                                  text: 'See More',
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                RatingBar.builder(
                                  initialRating: 4,
                                  minRating: 1,
                                  itemSize: 15,
                                  direction: Axis.horizontal,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ).paddingSymmetric(vertical: 5),
                                customWidth(7),
                                Text(
                                  '4.5',
                                  style: AppFontStyle.greyOpenSans12W400,
                                ),
                                customWidth(7),
                                Text('(12,679 Review)', style: AppFontStyle.greyOpenSans12W400)
                              ],
                            ),
                            height16,
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: Image(
                                    image: imagesUserProfile,
                                    height: 48,
                                    width: 48,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'James Lawson',
                                      style: AppFontStyle.blackOpenSans14W600,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 4,
                                      minRating: 1,
                                      itemSize: 15,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.amber,
                                      ),
                                      onRatingUpdate: (rating) {
                                        print(rating);
                                      },
                                    ).paddingSymmetric(vertical: 5),
                                  ],
                                ).marginOnly(left: 10)
                              ],
                            ),
                            height12,
                            Text(
                              'Its too good. I always use samsung duento the quality, privacy and memory. But charger should also be given with the new mobile phone.',
                              style: AppFontStyle.greyOpenSans12W400,
                            ),
                            height12,
                            SizedBox(
                              height: 75,
                              child: ListView.builder(
                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image(image: imagesReviewImage).marginOnly(right: 12));
                                },
                              ),
                            ),
                            height10,
                            Text(
                              'December 10, 2023',
                              style: AppFontStyle.greyOpenSans12W400,
                            ),
                            height20,
                            Text(
                              'Similar products',
                              style: AppFontStyle.blackOpenSans16W600,
                            ),
                            height14,
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: 4,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 2 / 2.85),
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: offWhite,
                                        blurRadius: 10.0, // soften the shadow
                                        spreadRadius: 3.0, //extend the shadow
                                        offset: Offset(
                                          1.0, // Move to right 5  horizontally
                                          1.0, // Move to bottom 5 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                  child: Stack(
                                    children: [
                                      Column(
                                        children: [
                                          SizedBox(
                                              height: 100,
                                              child: Image(
                                                image: imagesCategoryProduct1,
                                                fit: BoxFit.cover,
                                              )),
                                          height10,
                                          Text(
                                            'SAMSUNG Galaxy M34 5G without charger (Prism Silver, 128 GB)',
                                            style: AppFontStyle.blackOpenSans12W600
                                                .copyWith(height: 1.5),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                '\$16,899',
                                                style: AppFontStyle.blackOpenSans16W700
                                                    .copyWith(color: colorPrimary2),
                                              ),
                                              width05,
                                              Text(
                                                '\$24,499',
                                                style: AppFontStyle.greyOpenSans12W400.copyWith(
                                                    decoration: TextDecoration.lineThrough),
                                              )
                                            ],
                                          ).marginSymmetric(vertical: 4),
                                          Row(
                                            children: [
                                              Text(
                                                '31% OFF',
                                                style: AppFontStyle.blackOpenSans12W500
                                                    .copyWith(color: colorPrimary2),
                                              ),
                                              width05,
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 17,
                                                    color: colorPrimary,
                                                  ),
                                                  width05,
                                                  Text(
                                                    '4.9',
                                                    style: AppFontStyle.blackOpenSans12W500
                                                        .copyWith(
                                                            decoration: TextDecoration.lineThrough),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ).marginSymmetric(vertical: 4)
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: Obx(() {
                                          return appBarButton(
                                              image: iconsLike,
                                              iconColor:
                                                  likedSimilarProduct.contains(index) ? red : black,
                                              callBack: () {
                                                likedSimilarProduct.contains(index)
                                                    ? likedSimilarProduct.remove(index)
                                                    : likedSimilarProduct.add(index);
                                              },
                                              height: 28,
                                              width: 28,
                                              iconPadding: 4);
                                        }),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            customHeight(100),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget commonProductDetailsRow({required String title, required String subTitle}) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(top: BorderSide(color: colorLightGrey, width: 1))),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: AppFontStyle.blackOpenSans12W500,
            ),
          ),
          Expanded(
            child: Text(
              subTitle,
              style: AppFontStyle.greyOpenSans12W400,
            ),
          ),
        ],
      ),
    );
  }
}
