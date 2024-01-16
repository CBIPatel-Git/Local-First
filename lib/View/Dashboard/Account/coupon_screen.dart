import '../../../Utility/utility_export.dart';

class CouponScreen extends StatefulWidget {
  const CouponScreen({super.key});

  @override
  State<CouponScreen> createState() => _CouponScreenState();
}

class _CouponScreenState extends State<CouponScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              commonAppBar(
                  preFix: Image(image: iconsBackIcon),
                  title: Text(
                    'Coupon',
                    style: AppFontStyle.blackOpenSans18W600,
                  ),
                  sufFix: Image(image: iconsInfo)),
              Text(
                'Best offers for you',
                style: AppFontStyle.blackOpenSans16W600,
              ).paddingOnly(left: 20),
              height16,
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: 10,
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
                                      'Welcome200',
                                      style: AppFontStyle.blackOpenSans20W600,
                                    ),
                                    Text(
                                      'Add items worth \$2 more to unlock',
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
                                Container(
                                  padding: const EdgeInsets.symmetric(vertical: 15),
                                  color: orangeFFE5C1,
                                  child: Center(
                                    child: Text(
                                      'Copy Code',
                                      style: AppFontStyle.blackOpenSans14W600
                                          .copyWith(color: colorPrimary),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          // Positioned(
                          //   top: 0,
                          //   bottom: 0,
                          //   left: 0,
                          //   child: Center(
                          //     child: Container(
                          //       height: 32,
                          //       width: 32,
                          //       decoration: const BoxDecoration(
                          //         color: white,
                          //         borderRadius: BorderRadius.all(Radius.circular(100)),
                          //         // border: Border.all(color: )
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // Positioned(
                          //   top: 0,
                          //   bottom: 0,
                          //   right: 0,
                          //   child: Center(
                          //     child: Container(
                          //       height: 32,
                          //       width: 32,
                          //       decoration: const BoxDecoration(
                          //         color: white,
                          //         borderRadius: BorderRadius.all(Radius.circular(100)),
                          //         // border: Border.all(color: )
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ).paddingOnly(bottom: 14);
                    }),
              )
            ],
          ),
        ));
  }
}