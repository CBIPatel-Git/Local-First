import '../../Utility/utility_export.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 95,
                color: colorPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                            width: 156,
                            height: 37,
                            child: Image(image: imagesAppLogo, height: 100)),
                        Text(
                          '30-Nov-2024',
                          style: AppFontStyle.blackOpenSans14W600.copyWith(color: white),
                        ),
                      ],
                    ),
                    appBarButton(
                        image: iconsIconInfoCircle,
                        callBack: () {},
                        backgroundColor: Colors.transparent,
                        borderColor: Colors.transparent)
                  ],
                ).marginSymmetric(horizontal: 20),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    customHeight(8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'INFO',
                              style: AppFontStyle.greyOpenSans14W500,
                            ),
                            Text(
                              'Invoice#232213',
                              style: AppFontStyle.blackOpenSans14W400,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'TAX ID ',
                              style: AppFontStyle.greyOpenSans14W500,
                            ),
                            Text(
                              'JDH276472828DD',
                              style: AppFontStyle.blackOpenSans14W400,
                            ),
                          ],
                        )
                      ],
                    ),
                    customHeight(26),
                    Text(
                      'TO',
                      style: AppFontStyle.greyOpenSans14W500,
                    ),
                    height05,
                    Text(
                      'LocalFirst Inc.',
                      style: AppFontStyle.blackOpenSans14W400,
                    ),
                    Text(
                      '134, High street, New Jersey, NYC, 1123233',
                      style: AppFontStyle.blackOpenSans14W400,
                    ),
                    height05,
                    Text(
                      'localfirst@gamail.com',
                      style: AppFontStyle.greyOpenSans14W400,
                    ),
                    Text(
                      '+1(233)3423-2323',
                      style: AppFontStyle.greyOpenSans14W400,
                    ),
                    customHeight(20),
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            offset: const Offset(1, 1.5), //(x,y)
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          commonRow(
                                  title: 'DESCRIPTION',
                                  rate: 'RATE',
                                  qty: 'QTY',
                                  subTotal: 'SUBTOTAL',
                                  isTitle: true)
                              .marginOnly(top: 17, bottom: 11),
                          const Divider(),
                          commonRow(
                                  title: 'SAMSUNG Galaxy M14 5G (Icy Silver SAMSUNG Galaxy M14 5G)',
                                  rate: '\$3000',
                                  qty: '3',
                                  subTotal: '\$9000',
                                  isTitle: false)
                              .marginOnly(top: 12, bottom: 6),
                          commonRow(
                                  title: 'SAMSUNG Galaxy M14 5G (Icy Silver SAMSUNG Galaxy M14 5G)',
                                  rate: '\$18000',
                                  qty: '2',
                                  subTotal: '\$36000',
                                  isTitle: false)
                              .marginOnly(top: 6, bottom: 12)
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: const Offset(1, 1.5), //(x,y)
                                  blurRadius: 10,
                                ),
                              ],
                            ),
                            child: Image(
                              height: 145,
                              width: getScreenWidth(context),
                              image: imagesVendorCardBg,
                              fit: BoxFit.cover,
                            )),
                        Column(
                          children: [
                            height16,
                            commonPricingRow(title: 'Subtotal', value: '\$45,000', discount: ''),
                            height05,
                            commonPricingRow(title: 'Discount', value: '\$1323', discount: '12%'),
                            height05,
                            commonPricingRow(title: 'TAX', value: '\$300', discount: ''),
                            height16,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'GRAND TOTAL',
                                  style: AppFontStyle.blackOpenSans14W700
                                      .copyWith(color: colorPrimary),
                                ),
                                Text(
                                  '\$44,000/-',
                                  style: AppFontStyle.blackOpenSans14W700,
                                )
                              ],
                            )
                          ],
                        ).marginSymmetric(horizontal: 15),
                      ],
                    ).marginOnly(top: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget commonPricingRow(
      {required String title, required String value, required String discount}) {
    return Row(
      children: [
        Text(
          title,
          style: AppFontStyle.greyOpenSans14W600,
        ),
        if (discount != "" && discount != 'null')
          Container(
            height: 20,
            decoration: BoxDecoration(color: colorPrimary, borderRadius: BorderRadius.circular(50)),
            child: Text(
              discount,
              style: AppFontStyle.blackOpenSans14W500.copyWith(color: white),
            ).paddingSymmetric(horizontal: 5),
          ).marginOnly(left: 5),
        const Spacer(),
        Text(
          '\$45,000',
          style: AppFontStyle.blackOpenSans14W600,
        ),
      ],
    );
  }

  Widget commonRow(
      {required String title,
      required String rate,
      required String qty,
      required String subTotal,
      required bool isTitle}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: Center(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: isTitle ? AppFontStyle.greyOpenSans14W600 : AppFontStyle.blackOpenSans14W600,
            ).marginOnly(left: 10),
          ),
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                rate,
                style: isTitle ? AppFontStyle.greyOpenSans14W500 : AppFontStyle.blackOpenSans14W600,
              ),
              Text(
                qty,
                style: isTitle ? AppFontStyle.greyOpenSans14W600 : AppFontStyle.blackOpenSans14W600,
              ),
              Text(
                subTotal,
                style: isTitle ? AppFontStyle.greyOpenSans14W600 : AppFontStyle.blackOpenSans14W600,
              ),
            ],
          ),
        )
      ],
    );
  }
}
