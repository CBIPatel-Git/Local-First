import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pinput/pinput.dart';
import '../../../Utility/utility_export.dart';

class ProductDetailsScreen extends StatefulWidget {
  int? productId;

  ProductDetailsScreen({super.key, this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  TextEditingController searchController = TextEditingController();
  RxInt currentIndex = 0.obs;
  RxBool isLoading = true.obs;
  final items = [
    Image(image: imagesItemPlaceholder, height: 236, fit: BoxFit.fitHeight),
    Image(image: imagesItemPlaceholder, height: 236, fit: BoxFit.fitHeight),
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

  RxInt selectedRam = 0.obs;
  List<String> subVariant = <String>[].obs;
  List<String> ramVariantList = [
    '4 GB',
    '8 GB',
    '12 GB',
  ];

  @override
  void initState() {
    super.initState();
    kCategoryController.getProductByIdAPICall({}, widget.productId ?? 0, () {
      isLoading.value = false;
    });
    // selectedColor.value = colorList.first.value;
    // selectedRam.value = ramVariantList.first;
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        bottomNavigation: Row(
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
                  .marginOnly(right: 5),
            ),
            Expanded(
              child: commonIconTextButton(title: 'Buy Now', callBack: () {}).marginOnly(left: 5),
            ),
          ],
        ).paddingSymmetric(horizontal: 16, vertical: 10),
        context: context,
        child: SafeArea(
          child: Obx(() {
            return Column(
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
                        style:
                            AppFontStyle.blackOpenSans12W600.copyWith(color: white, fontSize: 10),
                      ),
                      child: appBarButton(image: iconsCart, callBack: () {})),
                ),
                isLoading.value == false
                    ? kCategoryController.getProductByIdModel.value.data != null
                        ? Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  height10,
                                  SizedBox(
                                    height: 236,
                                    child: Stack(
                                      children: [
                                        Obx(() {
                                          return CarouselSlider(
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
                                            items: kCategoryController
                                                        .getProductByIdModel.value.data !=
                                                    null
                                                ? kCategoryController
                                                    .getProductByIdModel.value.data?.images
                                                    .map((e) => CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl: e.src ?? '',
                                                          errorWidget: (context, url, error) =>
                                                              const Icon(
                                                            Icons.error,
                                                            color: Colors.grey,
                                                          ),
                                                        ))
                                                    .toList()
                                                : items,
                                          );
                                        }),
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
                                  Obx(() {
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(
                                          kCategoryController.getProductByIdModel.value.data != null
                                              ? kCategoryController.getProductByIdModel.value.data
                                                      ?.images.length ??
                                                  0
                                              : items.length,
                                          (index) => Obx(() {
                                                return customIndicator(
                                                    index: index, currentIndex: currentIndex.value);
                                              })),
                                    );
                                  }).paddingSymmetric(vertical: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${kCategoryController.getProductByIdModel.value.data?.name}',
                                          style: AppFontStyle.blackOpenSans18W700,
                                        ),
                                        RatingBar.builder(
                                          initialRating: double.parse(kCategoryController
                                                  .getProductByIdModel.value.data?.averageRating ??
                                              '0'),
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
                                        Obx(() {
                                          return Row(
                                            children: [
                                              Flexible(
                                                child: Text(
                                                  '\$${kCategoryController.getProductByIdModel.value.data?.price ?? 0}',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppFontStyle.blackOpenSans20W600.copyWith(
                                                      fontWeight: FontWeight.w700,
                                                      color: colorPrimary),
                                                ).paddingOnly(right: 10),
                                              ),
                                              Flexible(
                                                child: Text(
                                                  '\$${kCategoryController.getProductByIdModel.value.data?.regularPrice ?? '0'}',
                                                  overflow: TextOverflow.ellipsis,
                                                  style: AppFontStyle.greyOpenSans20W500.copyWith(
                                                      fontWeight: FontWeight.w400,
                                                      decoration: TextDecoration.lineThrough),
                                                ).paddingOnly(right: 10),
                                              ),
                                              Flexible(
                                                child: kCategoryController.getProductByIdModel.value
                                                            .data?.onSale ==
                                                        true
                                                    ? Text(
                                                        '(Extra \$3583 off)',
                                                        overflow: TextOverflow.ellipsis,
                                                        style: AppFontStyle.blackOpenSans14W500
                                                            .copyWith(color: green),
                                                      )
                                                    : const SizedBox(),
                                              ),
                                            ],
                                          );
                                        }),
                                        if (kCategoryController.getProductByIdModel.value.data !=
                                                null &&
                                            kCategoryController.getProductByIdModel.value.data!
                                                .attributes.isNotEmpty)
                                          Obx(() {
                                            return Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: kCategoryController
                                                    .getProductByIdModel.value.data!.attributes
                                                    .map((e) {
                                                  if (e['options'] != null) {
                                                    subVariant = e['options'].cast<String>();
                                                  }
                                                  return Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      height20,
                                                      Text(
                                                        '${e['name']}',
                                                        style: AppFontStyle.blackOpenSans14W700,
                                                      ),
                                                      height12,
                                                      SizedBox(
                                                        height: 40,
                                                        child: Row(
                                                          children: subVariant
                                                              .map((val) => e['name'] == 'Color' ||
                                                                      e['name'] == 'Colors'
                                                                  ? InkWell(
                                                                      splashColor: white,
                                                                      highlightColor: white,
                                                                      onTap: () {
                                                                        print(
                                                                            '>>>>>>>>>>> ${val.length}');
                                                                        selectedColor.value =
                                                                            val.length;
                                                                      },
                                                                      child: Stack(
                                                                        children: [
                                                                          Container(
                                                                            height: 30,
                                                                            width: 30,
                                                                            decoration: BoxDecoration(
                                                                                color: val == "Red"
                                                                                    ? ping
                                                                                    : val == "Yellow"
                                                                                        ? amber
                                                                                        : val == "Blue"
                                                                                            ? blue
                                                                                            : val == "Black"
                                                                                                ? black
                                                                                                : colorPrimary,
                                                                                borderRadius: BorderRadius.circular(100)),
                                                                          ),
                                                                          if (selectedColor.value ==
                                                                              val.length)
                                                                            Positioned(
                                                                              top: 0,
                                                                              left: 0,
                                                                              right: 0,
                                                                              bottom: 0,
                                                                              child: Container(
                                                                                height: 16,
                                                                                width: 16,
                                                                                margin:
                                                                                    const EdgeInsets
                                                                                        .all(7),
                                                                                decoration: BoxDecoration(
                                                                                    color: white,
                                                                                    borderRadius:
                                                                                        BorderRadius
                                                                                            .circular(
                                                                                                100)),
                                                                              ),
                                                                            )
                                                                        ],
                                                                      ),
                                                                    ).paddingOnly(right: 10)
                                                                  : e['name'] == 'Brand'
                                                                      ? Container(
                                                                          height: 38,
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal: 16),
                                                                          decoration: BoxDecoration(
                                                                              color: white,
                                                                              borderRadius:
                                                                                  BorderRadius
                                                                                      .circular(
                                                                                          100),
                                                                              border: Border.all(
                                                                                  color: cardBorder,
                                                                                  width: 1)),
                                                                          child: Center(
                                                                            child: Text(
                                                                              val,
                                                                              style: AppFontStyle
                                                                                  .blackOpenSans14W500
                                                                                  .copyWith(
                                                                                      fontSize: 15,
                                                                                      color:
                                                                                          textColor),
                                                                            ),
                                                                          ),
                                                                        )
                                                                      : InkWell(
                                                                          splashColor: white,
                                                                          highlightColor: white,
                                                                          onTap: () {
                                                                            selectedRam.value =
                                                                                val.length;
                                                                          },
                                                                          child: Obx(() {
                                                                            return Container(
                                                                              height: 38,
                                                                              padding:
                                                                                  const EdgeInsets
                                                                                      .symmetric(
                                                                                      horizontal:
                                                                                          16),
                                                                              decoration: BoxDecoration(
                                                                                  color: selectedRam.value ==
                                                                                          val.length
                                                                                      ? colorPrimary2
                                                                                      : white,
                                                                                  borderRadius:
                                                                                      BorderRadius
                                                                                          .circular(
                                                                                              100),
                                                                                  border: Border.all(
                                                                                      color: selectedRam
                                                                                                  .value ==
                                                                                              val.length
                                                                                          ? colorPrimary2
                                                                                          : cardBorder,
                                                                                      width: 1)),
                                                                              child: Center(
                                                                                child: Text(
                                                                                  val,
                                                                                  style: AppFontStyle
                                                                                      .blackOpenSans14W500
                                                                                      .copyWith(
                                                                                          fontSize:
                                                                                              15,
                                                                                          color: selectedRam.value ==
                                                                                                  val.length
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
                                                    ],
                                                  );
                                                }).toList());
                                          }),
                                        height20,
                                        Text(
                                          'Specification',
                                          style: AppFontStyle.blackOpenSans14W700,
                                        ),
                                        height20,
                                        if (kCategoryController.getProductByIdModel.value.data !=
                                                null &&
                                            kCategoryController.getProductByIdModel.value.data!
                                                .attributes.isNotEmpty)
                                          Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: kCategoryController
                                                  .getProductByIdModel.value.data!.attributes
                                                  .map(
                                                    (e) => commonProductDetailsRow(
                                                        title: e['name'],
                                                        subTitle: e['options'][0],
                                                        index: e['name'].length),
                                                  )
                                                  .toList()),
                                        height18,
                                        if (kCategoryController
                                                    .getProductByIdModel.value.data?.description !=
                                                null &&
                                            kCategoryController.getProductByIdModel.value.data
                                                    ?.description?.isNotEmpty ==
                                                true)
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Description',
                                                style: AppFontStyle.blackOpenSans14W700,
                                              ),
                                              height12,
                                              Html(
                                                data:
                                                    '${kCategoryController.getProductByIdModel.value.data?.description}',
                                                style: {
                                                  "body": Style(
                                                      color: colorGrey, fontWeight: FontWeight.w400)
                                                },
                                              ),
                                            ],
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
                                            Text('(12,679 Review)',
                                                style: AppFontStyle.greyOpenSans12W400)
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
                                                  child: Image(image: imagesReviewImage)
                                                      .marginOnly(right: 12));
                                            },
                                          ),
                                        ),
                                        height10,
                                        Text(
                                          'December 10, 2023',
                                          style: AppFontStyle.greyOpenSans12W400,
                                        ),
                                        height20,
                                        if (kCategoryController.getProductByIdModel.value
                                                .relatedProducts?.isNotEmpty ==
                                            true)
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Similar products',
                                                style: AppFontStyle.blackOpenSans16W600,
                                              ),
                                              height14,
                                              kCategoryController.getProductByIdModel.value
                                                          .relatedProducts?.isNotEmpty ==
                                                      true
                                                  ? GridView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: kCategoryController
                                                          .getProductByIdModel
                                                          .value
                                                          .relatedProducts
                                                          ?.length,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      gridDelegate:
                                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                                              crossAxisCount: 2,
                                                              mainAxisExtent: 250),
                                                      itemBuilder: (context, index) {
                                                        return Container(
                                                          margin: const EdgeInsets.symmetric(
                                                              horizontal: 4, vertical: 8),
                                                          padding: const EdgeInsets.all(8),
                                                          decoration: BoxDecoration(
                                                            color: white,
                                                            borderRadius: BorderRadius.circular(12),
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                color: offWhite,
                                                                blurRadius:
                                                                    10.0, // soften the shadow
                                                                spreadRadius:
                                                                    3.0, //extend the shadow
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
                                                                      height: 95,
                                                                      child: kCategoryController
                                                                                  .getProductByIdModel
                                                                                  .value
                                                                                  .relatedProducts?[
                                                                                      index]
                                                                                  .images
                                                                                  .isNotEmpty ==
                                                                              true
                                                                          ? CachedNetworkImage(
                                                                              fit: BoxFit.cover,
                                                                              imageUrl: kCategoryController
                                                                                      .getProductByIdModel
                                                                                      .value
                                                                                      .relatedProducts?[
                                                                                          index]
                                                                                      .images[0]
                                                                                      .src ??
                                                                                  '',
                                                                              errorWidget: (context,
                                                                                      url, error) =>
                                                                                  const Icon(
                                                                                Icons.error,
                                                                                color: Colors.grey,
                                                                              ),
                                                                            )
                                                                          : Image(
                                                                              image:
                                                                                  imagesCategoryProduct1,
                                                                              fit: BoxFit.cover,
                                                                            )),
                                                                  height10,
                                                                  Text(
                                                                    kCategoryController
                                                                            .getProductByIdModel
                                                                            .value
                                                                            .relatedProducts?[index]
                                                                            .name ??
                                                                        '',
                                                                    maxLines: 3,
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: AppFontStyle
                                                                        .blackOpenSans12W600
                                                                        .copyWith(height: 1.5),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        " \$${kCategoryController.getProductByIdModel.value.relatedProducts?[index].salePrice ?? ''}",
                                                                        style: AppFontStyle
                                                                            .blackOpenSans16W700
                                                                            .copyWith(
                                                                                color:
                                                                                    colorPrimary2),
                                                                      ),
                                                                      width05,
                                                                      Text(
                                                                        "\$${kCategoryController.getProductByIdModel.value.relatedProducts?[index].regularPrice ?? ''}",
                                                                        style: AppFontStyle
                                                                            .greyOpenSans12W400
                                                                            .copyWith(
                                                                                decoration:
                                                                                    TextDecoration
                                                                                        .lineThrough),
                                                                      )
                                                                    ],
                                                                  ).marginSymmetric(vertical: 4),
                                                                  Row(
                                                                    children: [
                                                                      kCategoryController
                                                                                  .getProductByIdModel
                                                                                  .value
                                                                                  .relatedProducts?[
                                                                                      index]
                                                                                  .onSale ==
                                                                              true
                                                                          ? Text(
                                                                              '31% OFF',
                                                                              style: AppFontStyle
                                                                                  .blackOpenSans12W500
                                                                                  .copyWith(
                                                                                      color:
                                                                                          colorPrimary2),
                                                                            )
                                                                          : const SizedBox(),
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
                                                                            style: AppFontStyle
                                                                                .blackOpenSans12W500,
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
                                                                      iconColor: likedSimilarProduct
                                                                              .contains(index)
                                                                          ? red
                                                                          : black,
                                                                      callBack: () {
                                                                        likedSimilarProduct
                                                                                .contains(index)
                                                                            ? likedSimilarProduct
                                                                                .remove(index)
                                                                            : likedSimilarProduct
                                                                                .add(index);
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
                                                    )
                                                  : const SizedBox(),
                                              customHeight(50),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : const SizedBox()
                    : const Expanded(child: Center(child: CircularProgressIndicator())),
              ],
            );
          }),
        ));
  }

  Widget commonProductDetailsRow({required String title, required String subTitle, int? index}) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  color: index !=
                          kCategoryController.getProductByIdModel.value.data!.attributes.length - 1
                      ? red
                      : colorLightGrey,
                  width: 1))),
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

// SizedBox(
// height: 40,
// child: ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: kCategoryController
//     .getProductByIdModel
//     .value
//     .data!
//     .attributes
//     .length,
// itemBuilder: (_, index) {
// return InkWell(
// splashColor: white,
// highlightColor: white,
// onTap: () {
// // selectedRam.value = e;
// },
// child: Obx(() {
// return Container(
// height: 38,
// padding: const EdgeInsets.symmetric(
// horizontal: 16),
// decoration: BoxDecoration(
// color: selectedRam.value == e
// ? colorPrimary2
//     : white,
// borderRadius:
// BorderRadius.circular(100),
// border: Border.all(
// color: selectedRam.value == e
// ? colorPrimary2
//     : cardBorder,
// width: 1)),
// child: Center(
// child: Text(
// '${kCategoryController.getProductByIdModel.value.data!.attributes[index]["options"][index]}',
// style: AppFontStyle
//     .blackOpenSans14W500
//     .copyWith(
// fontSize: 15,
// color:
// selectedRam.value == e
// ? white
//     : textColor),
// ),
// ),
// );
// }),
// ).paddingOnly(right: 10);
// }),
// ),
