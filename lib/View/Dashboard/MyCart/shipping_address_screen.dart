import 'package:local_first/View/Dashboard/MyCart/add_address_screen.dart';
import 'package:local_first/View/Dashboard/MyCart/payment_method_screen.dart';

import '../../../Utility/utility_export.dart';

class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {
  RxInt selectedAddress = 0.obs;

  @override
  Widget build(BuildContext context) {
    return commonStructure(
      bottomNavigation: commonFilledButton(
              onTap: () {
                Get.to(() => const PaymentMethodScreen());
              },
              title: 'Processed for Payment')
          .paddingSymmetric(horizontal: 20, vertical: 24),
      context: context,
      child: SafeArea(
        child: SingleChildScrollView(
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
                    'Shipping Address',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsBell, callBack: () {})),
              Text(
                '2 Address Saved',
                style: AppFontStyle.greyOpenSans14W400,
              ).paddingOnly(left: 20),
              StreamBuilder<Object>(
                  stream: selectedAddress.stream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              selectedAddress.value = index;
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                              decoration: BoxDecoration(
                                color: selectedAddress.value == index
                                    ? colorPrimary.withOpacity(0.10)
                                    : white,
                                borderRadius: const BorderRadius.all(Radius.circular(12)),
                                border: Border.all(
                                    color: selectedAddress.value == index ? colorPrimary : white),
                                boxShadow: [
                                  selectedAddress.value == index
                                      ? const BoxShadow(color: Colors.white)
                                      : const BoxShadow(
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
                                children: [
                                  Image(image: iconsYourLocation),
                                  width14,
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 6, vertical: 4),
                                              decoration: BoxDecoration(
                                                  color: colorPrimary2.withOpacity(0.10),
                                                  border: Border.all(color: colorPrimary2),
                                                  borderRadius:
                                                      const BorderRadius.all(Radius.circular(25))),
                                              child: Row(
                                                children: [
                                                  Image(
                                                    image: iconsHome,
                                                    color: colorPrimary2,
                                                  ),
                                                  customWidth(8),
                                                  Text(
                                                    'Home',
                                                    style: AppFontStyle.blackOpenSans14W500
                                                        .copyWith(color: colorPrimary2),
                                                  )
                                                ],
                                              ),
                                            ),
                                            width12,
                                            Text(
                                              'Default',
                                              style: AppFontStyle.blackOpenSans12W600,
                                            )
                                          ],
                                        ),
                                        height10,
                                        Text(
                                          '4517 Washington Ave Kentucky',
                                          overflow: TextOverflow.ellipsis,
                                          style: AppFontStyle.greyOpenSans14W500,
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Get.to(() => AddAddressScreen(screenType: 'Edit Address'));
                                      },
                                      child: Image(image: iconsEditLine)),
                                ],
                              ),
                            ),
                          );
                        });
                  }),
              customHeight(48),
              commonFilledButton(
                      onTap: () {
                        Get.to(() => AddAddressScreen(
                              screenType: 'Add Address',
                            ));
                      },
                      title: 'Add New Address',
                      bgColor: offWhite,
                      textStyle: AppFontStyle.greyOpenSans16W600)
                  .paddingSymmetric(horizontal: 20),
            ],
          ),
        ),
      ),
    );
  }
}
