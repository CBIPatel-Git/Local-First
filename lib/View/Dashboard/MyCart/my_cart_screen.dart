import 'package:dotted_line/dotted_line.dart';
import 'package:local_first/View/Dashboard/MyCart/shipping_address_screen.dart';

import '../../../Utility/utility_export.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  String? selectedValue;
  TextEditingController codeController = TextEditingController();

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
                    'My Cart',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsBell, callBack: () {})),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(() => const ShippingAddressScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(10.0),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
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
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                const BorderRadius.all(Radius.circular(5)),
                                            child: Image(
                                              height: 62,
                                              width: 62,
                                              image: imagesShoes,
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
                                              height05,
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      '\$21,999',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppFontStyle.blackOpenSans12W600
                                                          .copyWith(fontWeight: FontWeight.w700),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      '\$27,999',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppFontStyle.greyOpenSans12W500
                                                          .copyWith(
                                                              decoration:
                                                                  TextDecoration.lineThrough),
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Text(
                                                      '22% off',
                                                      overflow: TextOverflow.ellipsis,
                                                      style: AppFontStyle.greyOpenSans12W500
                                                          .copyWith(color: colorPrimary2),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        width12,
                                        appBarButton(
                                            callBack: () {},
                                            image: iconsCartFavorite,
                                            height: 26,
                                            width: 26),
                                        customWidth(6),
                                        appBarButton(
                                            callBack: () {
                                              removeItemDialog();
                                            },
                                            image: iconsDelete,
                                            height: 26,
                                            width: 26),
                                      ],
                                    ),
                                    height05,
                                    Row(
                                      children: [
                                        createRoundedDropDown(),
                                        width10,
                                        Flexible(
                                          child: Text(
                                            'Delivery by 11PM, Tomorrow',
                                            style: AppFontStyle.blackOpenSans12W400
                                                .copyWith(fontSize: 10),
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                          ),
                                        ),
                                        customWidth(3),
                                        Container(
                                          width: 1,
                                          height: 14,
                                          color: colorGrey,
                                        ),
                                        customWidth(3),
                                        Text(
                                          '\$70',
                                          style: AppFontStyle.blackOpenSans12W400
                                              .copyWith(fontSize: 10),
                                          textAlign: TextAlign.center,
                                        ),
                                        customWidth(02),
                                        Flexible(
                                          child: Text(
                                            'FREE DELIVERY',
                                            style: AppFontStyle.blackOpenSans12W400
                                                .copyWith(fontSize: 10, color: green),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            height20,
                            commonTextField(
                                hintText: 'Promo Code',
                                textEditingController: codeController,
                                borderRadius: 100,
                                preFixIcon: iconsPromoCode,
                                suffixIcon: Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 9),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5).copyWith(right: 6),
                                  decoration: const BoxDecoration(
                                      color: colorPrimary,
                                      borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Text(
                                    'Apply',
                                    style: AppFontStyle.blackOpenSans16W600.copyWith(color: white),
                                  ),
                                )),
                            height20,
                            Text(
                              'Price Details',
                              style: AppFontStyle.blackOpenSans14W700,
                            ),
                            height16,
                            commonProductRow(priceName: 'Price (3 Items)', priceData: '\$598.86'),
                            height16,
                            commonProductRow(priceName: 'Discount', priceData: '\$40.00'),
                            height16,
                            commonProductRow(
                                priceName: 'Delivery charges',
                                deliveryPrice: '\$140',
                                priceData: 'FREE DELIVERY'),
                            height16,
                            commonProductRow(
                                priceName: 'Secured Packaging Fee', priceData: '\$128'),
                            height18,
                            const DottedLine(
                              dashColor: cardBorder,
                            ),
                            height12,
                            commonProductRow(
                                priceName: 'Total Amount',
                                priceData: '\$766.86',
                                style: AppFontStyle.blackOpenSans12W600.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                                subTextStyle: AppFontStyle.blackOpenSans12W600
                                    .copyWith(fontWeight: FontWeight.w700, color: colorPrimary)),
                            height12,
                            const DottedLine(
                              dashColor: cardBorder,
                            ),
                            height12,
                            Text(
                              'You will save \$15,605 on this order',
                              style: AppFontStyle.blackOpenSans12W500.copyWith(color: green),
                            ),
                            customHeight(128)
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

  Widget createRoundedDropDown() {
    return Container(
      width: 62,
      decoration: BoxDecoration(
        border: Border.all(color: colorLightGrey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
              borderRadius: BorderRadius.circular(10),
              style: AppFontStyle.blackOpenSans12W500,
              hint: Text(
                "Qty 1",
                style: AppFontStyle.blackOpenSans12W500,
              ),
              value: selectedValue,
              isDense: true,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
              icon: Image(
                image: iconsDown,
              ),
              items: const [
                DropdownMenuItem(value: "Qty 1", child: Text("Qty 1")),
                DropdownMenuItem(value: "Qty 2", child: Text("Qty 2")),
                DropdownMenuItem(value: "Qty 3", child: Text("Qty 3")),
              ]),
        ),
      ),
    );
  }

  commonProductRow(
      {required String priceName,
      required String priceData,
      String? deliveryPrice,
      TextStyle? style,
      TextStyle? subTextStyle}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          priceName,
          style: style ?? AppFontStyle.greyOpenSans12W400,
        ),
        Row(
          children: [
            Text(
              deliveryPrice ?? '',
              style: AppFontStyle.greyOpenSans12W500,
            ),
            width05,
            Text(
              priceData,
              style: subTextStyle ??
                  AppFontStyle.blackOpenSans12W500
                      .copyWith(color: deliveryPrice != null ? green : black),
            ),
          ],
        ),
      ],
    );
  }

  Future<void> removeItemDialog() async {
    return showDialog<void>(
      context: context,

      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          backgroundColor: white,
          title: Text(
            'Remove Item',
            style: AppFontStyle.blackOpenSans18W600,
            textAlign: TextAlign.center,
          ),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image(image: imagesRemoveItem),
                height16,
                Text(
                  'Are you sure you want to remove this item?',
                  textAlign: TextAlign.center,
                  style: AppFontStyle.greyOpenSans16W400,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 22),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                        decoration: const BoxDecoration(
                            color: offWhite, borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Confirm',
                          style: AppFontStyle.greyOpenSans16W600,
                        )),
                    onPressed: () {
                      print('Confirmed');
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 13),
                        decoration: const BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(30))),
                        child: Text(
                          'Remove',
                          style: AppFontStyle.greyOpenSans16W600.copyWith(color: white),
                        )),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
