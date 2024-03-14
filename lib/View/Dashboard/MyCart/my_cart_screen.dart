import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:local_first/View/Dashboard/MyCart/shipping_address_screen.dart';

import '../../../Models/CartModels/my_cart_model.dart' as datum;
import '../../../Utility/utility_export.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  // RxInt quantity = 1.obs;
  int updateIndex = 0;
  TextEditingController codeController = TextEditingController();

  RxList<datum.FinalCartDatum> data = <datum.FinalCartDatum>[].obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map<String, dynamic> params = {
      "user_id": kAuthenticationController.userId,
    };
    kCartController.myCartApiCall(params, () {
      if (kCartController.myCartModel.value.data != null) {
        data.value = kCartController.myCartModel.value.data!.finalCartData;
      }
    });
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
                    'My Cart',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsBell, callBack: () {})),
              data != null || data.isNotEmpty
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StreamBuilder(
                                stream: data.stream,
                                builder: (context, snapshot) {
                                  return ListView.builder(
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      itemCount: data.length,
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            Get.to(() => const ShippingAddressScreen());
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(10.0),
                                            margin: const EdgeInsets.symmetric(horizontal: 20)
                                                .copyWith(top: 16),
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
                                            child: StatefulBuilder(builder: (context, setState) {
                                              return Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      ClipRRect(
                                                          borderRadius: const BorderRadius.all(
                                                              Radius.circular(5)),
                                                          child: commonNetworkImageView(
                                                              height: 70, width: 70, imageUrl: '')
                                                          // '${data[index].images.isNotEmpty ? data[index].images[0].src : ''}'),
                                                          ),
                                                      width10,
                                                      Flexible(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                          children: [
                                                            Text(
                                                              '${data[index].name}',
                                                              style:
                                                                  AppFontStyle.blackOpenSans14W600,
                                                            ),
                                                            height05,
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Flexible(
                                                                  child: Text(
                                                                    '\$${data[index].totalPrice}',
                                                                    overflow: TextOverflow.ellipsis,
                                                                    style: AppFontStyle
                                                                        .blackOpenSans12W600
                                                                        .copyWith(
                                                                            fontWeight:
                                                                                FontWeight.w700),
                                                                  ),
                                                                ),
                                                                // if (data[index].regularPrice != null &&
                                                                //     data[index].regularPrice!.isNotEmpty)
                                                                //   Flexible(
                                                                //     child: Text(
                                                                //       '\$${data[index].regularPrice}',
                                                                //       overflow: TextOverflow.ellipsis,
                                                                //       style: AppFontStyle.greyOpenSans12W500
                                                                //           .copyWith(
                                                                //               decoration:
                                                                //                   TextDecoration.lineThrough),
                                                                //     ),
                                                                //   ),
                                                                // data[index].onSale != null &&
                                                                //         (data[index].onSale ?? false)
                                                                //     ? Flexible(
                                                                //         child: Text(
                                                                //           '22% off',
                                                                //           overflow: TextOverflow.ellipsis,
                                                                //           style: AppFontStyle.greyOpenSans12W500
                                                                //               .copyWith(color: colorPrimary2),
                                                                //         ),
                                                                //       )
                                                                //     : const SizedBox(),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      width12,
                                                      appBarButton(
                                                          callBack: () {
                                                            Map<String, dynamic> params = {
                                                              "user_id":
                                                                  kAuthenticationController.userId,
                                                              "product_id": data[index].id
                                                            };
                                                            if (data[index].like == 0) {
                                                              data[index].like = 1;
                                                              kHomeController.addToWishlistAPICall(
                                                                  params, () {});
                                                            } else {
                                                              data[index].like = 0;
                                                              kHomeController
                                                                  .removeToWishlistAPICall(
                                                                      params, () {});
                                                            }
                                                            setState(() {});
                                                          },
                                                          image: iconsCartFavorite,
                                                          height: 26,
                                                          width: 26),
                                                      customWidth(6),
                                                      appBarButton(
                                                          callBack: () {
                                                            if (data[index].id != null) {
                                                              removeItemDialog(
                                                                  productId: data[index].id!,
                                                                  cartIndex: index);
                                                            }
                                                          },
                                                          image: iconsDelete,
                                                          height: 26,
                                                          width: 26),
                                                    ],
                                                  ),
                                                  height05,
                                                  Row(
                                                    children: [
                                                      createRoundedDropDown(index),
                                                      width10,
                                                      Flexible(
                                                        child: Text(
                                                          'Delivery by 11PM, Tomorrow',
                                                          style: AppFontStyle.blackOpenSans12W400
                                                              .copyWith(fontSize: 10),
                                                          textAlign: TextAlign.start,
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
                                              );
                                            }),
                                          ),
                                        );
                                      });
                                }),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                commonFilledButton(
                                        onTap: () {
                                          try {
                                            Map<String, dynamic> params1 = {
                                              "user_id": kAuthenticationController.userId,
                                              "product_data": data
                                                  .map((element) => {
                                                        "product_id": element.id,
                                                        "quantity": element.quantity,
                                                      })
                                                  .toList()
                                            };
                                            kCartController.addQuantityApiCall(params1, () {
                                              logPrint(params1);
                                            });
                                          } catch (e) {
                                            printLog(e);
                                          }
                                        },
                                        title: 'Update Cart',
                                        textStyle:
                                            AppFontStyle.blackOpenSans14W600.copyWith(color: white),
                                        textPadding: const EdgeInsets.symmetric(horizontal: 14))
                                    .marginSymmetric(horizontal: 5),
                                commonFilledButtonGrey(
                                        onTap: () {},
                                        title: 'Clear Cart',
                                        textStyle: AppFontStyle.greyOpenSans14W600,
                                        textPadding: const EdgeInsets.symmetric(horizontal: 14))
                                    .marginSymmetric(horizontal: 5),
                              ],
                            ).marginSymmetric(vertical: 10, horizontal: 16),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  commonTextField(
                                      hintText: 'Promo Code',
                                      textEditingController: codeController,
                                      borderRadius: 100,
                                      preFixIcon: iconsPromoCode,
                                      suffixIcon: Container(
                                        padding:
                                            const EdgeInsets.symmetric(horizontal: 26, vertical: 9),
                                        margin: const EdgeInsets.symmetric(vertical: 5)
                                            .copyWith(right: 6),
                                        decoration: const BoxDecoration(
                                            color: colorPrimary,
                                            borderRadius: BorderRadius.all(Radius.circular(20))),
                                        child: Text(
                                          'Apply',
                                          style: AppFontStyle.blackOpenSans16W600
                                              .copyWith(color: white),
                                        ),
                                      )),
                                  height20,
                                  Text(
                                    'Price Details',
                                    style: AppFontStyle.blackOpenSans14W700,
                                  ),
                                  height16,
                                  commonProductRow(
                                      priceName:
                                          'Price (${kCartController.myCartModel.value.data?.totalQty ?? 0}) Items',
                                      priceData:
                                          '\$${numFormatter(kCartController.myCartModel.value.data?.totalAmt ?? 0, considerNumber: 2)}'),
                                  height16,
                                  commonProductRow(
                                      priceName: 'Discount',
                                      priceData:
                                          '\$${numFormatter(kCartController.myCartModel.value.data?.totalDiscount ?? 0, considerNumber: 2)}'),
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
                                      priceData:
                                          '\$${numFormatter(kCartController.myCartModel.value.data?.totalAmt ?? 0, considerNumber: 2)}',
                                      style: AppFontStyle.blackOpenSans12W600.copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                      subTextStyle: AppFontStyle.blackOpenSans12W600.copyWith(
                                          fontWeight: FontWeight.w700, color: colorPrimary)),
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
                            ).marginSymmetric(vertical: 10),
                          ],
                        ),
                      ),
                    )
                  : Image(image: imagesItemPlaceholder),
            ],
          ),
        ));
  }

  Widget createRoundedDropDown(int index) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
        width: 70,
        decoration: BoxDecoration(
          border: Border.all(color: colorLightGrey),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                splashColor: white,
                highlightColor: white,
                onTap: () {
                  if (data[index].quantity != null && data[index].quantity! > 1) {
                    data[index].quantity = data[index].quantity! - 1;
                    updateIndex = index;
                    setState(() {});
                  }
                },
                child: const Icon(
                  Icons.remove_circle,
                  color: colorPrimary2,
                  size: 22,
                ),
              ),
              Obx(() {
                return Text(
                  '${data[index].quantity}',
                  style: AppFontStyle.blackOpenSans14W500,
                );
              }),
              InkWell(
                splashColor: white,
                highlightColor: white,
                onTap: () {
                  if (data[index].quantity != null &&
                      (data[index].quantity! > 0 && data[index].quantity! < 10)) {
                    data[index].quantity = data[index].quantity! + 1;
                    updateIndex = index;
                    setState(() {});
                  }
                },
                child: const Icon(
                  Icons.add_circle,
                  color: colorPrimary2,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      );
    });
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

  Future<void> removeItemDialog({required int productId, required int cartIndex}) async {
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
                          'Cancel',
                          style: AppFontStyle.greyOpenSans16W600,
                        )),
                    onPressed: () {
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
                      Map<String, dynamic> params = {
                        "user_id": kAuthenticationController.userId,
                        "product_id": productId
                      };
                      kCartController.removeToCartApiCall(params, () {
                        // Remove item from list
                        data.removeAt(cartIndex);
                      });
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
