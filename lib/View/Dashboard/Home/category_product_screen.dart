import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:local_first/View/Dashboard/Home/product_details_screen.dart';

import '../../../Utility/utility_export.dart';

class CategoryProductScreen extends StatefulWidget {
  const CategoryProductScreen({super.key});

  @override
  State<CategoryProductScreen> createState() => _CategoryProductScreenState();
}

class _CategoryProductScreenState extends State<CategoryProductScreen> {
  TextEditingController searchController = TextEditingController();

  String? selectedValue;
  List<String> storeByList = [
    'Sort By',
    'Brand',
    'Discount',
  ];

  List<String> resultsFilterList = [
    'Mobile',
    'Mobile 1',
    'Mobile 2',
  ];
  RxList<int> selectedFilter = <int>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // selectedValue = resultsFilterList.first;
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
              SizedBox(
                height: 40,
                child: ListView.builder(
                  itemCount: storeByList.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: white,
                      highlightColor: white,
                      onTap: () {
                        selectedFilter.contains(index)
                            ? selectedFilter.remove(index)
                            : selectedFilter.add(index);
                      },
                      child: Obx(() {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                  color: selectedFilter.contains(index)
                                      ? colorPrimary2
                                      : colorLightGrey,
                                  width: 1),
                              color: selectedFilter.contains(index)
                                  ? colorPrimary2.withOpacity(0.15)
                                  : white),
                          child: commonTextDropdown(
                              title: storeByList[index],
                              color: selectedFilter.contains(index) ? colorPrimary2 : textColor),
                        );
                      }),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '145 Result',
                      style: AppFontStyle.greyOpenSans12W600.copyWith(fontWeight: FontWeight.w700),
                    ),
                    createRoundedDropDown(),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      productList(length: 3),
                      SizedBox(
                        height: 160,
                        child: ListView.builder(
                          itemCount: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: 160,
                              width: getScreenWidth(context) * 0.83,
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image(image: imagesCategoryProductBanner)),
                            );
                          },
                        ),
                      ).marginSymmetric(vertical: 10),
                      productList(length: 3),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget createRoundedDropDown() {
    return StatefulBuilder(builder: (context, setState) {
      return DropdownButtonHideUnderline(
        child: DropdownButton<String>(
            borderRadius: BorderRadius.circular(10),
            style: AppFontStyle.greyOpenSans12W600
                .copyWith(fontWeight: FontWeight.w700, color: colorPrimary2),
            hint: Text(
              "Mobile",
              style: AppFontStyle.greyOpenSans12W600
                  .copyWith(fontWeight: FontWeight.w700, color: colorPrimary2),
            ),
            value: selectedValue,
            isDense: true,
            onChanged: (newValue) {
              setState(() {
                selectedValue = newValue;
              });
            },
            icon: const Icon(
              Icons.keyboard_arrow_down_rounded,
              color: colorPrimary2,
            ).paddingOnly(left: 5),
            items: const [
              DropdownMenuItem(value: "Qty 1", child: Text("Mobile ")),
              DropdownMenuItem(value: "Qty 2", child: Text("Mobile 1")),
              DropdownMenuItem(value: "Qty 3", child: Text("Mobile 2")),
            ]),
      );
    });
  }

  Widget productList({required int length}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            highlightColor: white,
            splashColor: white,
            onTap: () {
              Get.to(() => const ProductDetailsScreen());
            },
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: white,
                borderRadius: BorderRadius.all(Radius.circular(12)),
                boxShadow: [
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: Image(
                        width: 70,
                        image: imagesCategoryProduct1,
                        fit: BoxFit.fill,
                      )),
                  width10,
                  Flexible(
                    child: Column(
                      children: [
                        Text(
                          'SAMSUNG Galaxy M34 5G (Prism Silver, 128 GB)',
                          style: AppFontStyle.blackOpenSans14W600,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 7),
                          child: Row(
                            children: [
                              RatingBar.builder(
                                initialRating: 4.5,
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
                              ),
                              width10,
                              Text(
                                '(52,288)',
                                style: AppFontStyle.greyOpenSans12W400,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Text(
                                  '\$21,999',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppFontStyle.blackOpenSans12W600
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Text(
                                  '\$27,999',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppFontStyle.greyOpenSans12W500
                                      .copyWith(decoration: TextDecoration.lineThrough),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Text(
                                '22% off',
                                overflow: TextOverflow.ellipsis,
                                style:
                                    AppFontStyle.greyOpenSans12W500.copyWith(color: colorPrimary2),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  width12,
                  appBarButton(
                      callBack: () {}, image: iconsLike, height: 26, width: 26, iconPadding: 4),
                  customWidth(6),
                  appBarButton(
                      callBack: () {}, image: iconsCart, height: 26, width: 26, iconPadding: 4),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget commonTextDropdown({required String title, required Color color, TextStyle? textStyle}) {
    return Row(
      children: [
        Text(
          title,
          style: textStyle ?? AppFontStyle.blackOpenSans14W500.copyWith(color: color),
        ),
        width10,
        Icon(
          Icons.keyboard_arrow_down_rounded,
          color: color,
        )
      ],
    );
  }
}
