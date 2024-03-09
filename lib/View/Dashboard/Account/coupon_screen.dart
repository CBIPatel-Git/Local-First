import 'package:flutter/services.dart';

import '../../../Utility/utility_export.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  RxBool couponData = false.obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Map<String, dynamic> params = {"per_page": 10, "page": 1};
    kAccountController.getCouponAPICall(params, () {});
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonAppBar(
                  preFix: appBarButton(
                      image: iconsBackIcon,
                      callBack: () {
                        Get.back();
                      }),
                  title: Text(
                    'Coupon',
                    style: AppFontStyle.blackOpenSans18W600,
                  ),
                  sufFix: appBarButton(image: iconsInfo, callBack: () {})),
              Text(
                'Best offers for you',
                style: AppFontStyle.blackOpenSans16W600,
              ).paddingOnly(left: 20),
              height16,
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: kAccountController.getCouponModel.value.data?.length ?? 0,
                      itemBuilder: (cxt, index) {
                        return Stack(
                          children: [
                            Image(
                              image: imagesCouponBg,
                              height: 153,
                              width: getScreenWidth(context),
                              fit: BoxFit.fill,
                            ).marginSymmetric(horizontal: 16),
                            Container(
                              margin: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      height12,
                                      Text(
                                        '${kAccountController.getCouponModel.value.data?[index].code}',
                                        style: AppFontStyle.blackOpenSans20W600,
                                      ),
                                      Text(
                                        'Add items worth \$${kAccountController.getCouponModel.value.data?[index].minimumAmount} more to unlock',
                                        style: AppFontStyle.greyOpenSans14W500,
                                      ),
                                      height10,
                                      Row(
                                        children: [
                                          Image(image: iconsCouponSymbol),
                                          customWidth(8),
                                          Text(
                                            'GET 50% OFF FOR COMBO',
                                            style: AppFontStyle.blackOpenSans14W500,
                                          )
                                        ],
                                      ),
                                    ],
                                  ).paddingOnly(left: 37, bottom: 15),
                                  InkWell(
                                    onTap: () {
                                      if (kAccountController
                                                  .getCouponModel.value.data![index].code !=
                                              null &&
                                          kAccountController
                                              .getCouponModel.value.data![index].code!.isNotEmpty) {
                                        Clipboard.setData(ClipboardData(
                                            text: kAccountController
                                                .getCouponModel.value.data![index].code!));
                                        showToast(message: 'Copied!');
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 15),
                                      color: orangeFFE5C1,
                                      child: Center(
                                        child: Text(
                                          'Copy Code',
                                          style: AppFontStyle.blackOpenSans14W600
                                              .copyWith(color: colorPrimary),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ).paddingOnly(bottom: 14);
                      });
                }),
              )
            ],
          ),
        ));
  }
}
