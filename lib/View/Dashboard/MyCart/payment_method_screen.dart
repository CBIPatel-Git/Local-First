import 'package:dropdown_button2/dropdown_button2.dart';

import '../../../CustomWidget/custom_expansion_panellist.dart';
import '../../../Utility/utility_export.dart';
import '../Account/notification_screen.dart';
import 'order_success_screen.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String? radioValue;
  String? choice;
  RxBool isExpand = true.obs;

  @override
  void initState() {
    radioValue = "wallet";
    super.initState();
  }

  void radioButtonChanges(String? value) {
    setState(() {
      radioValue = value;
      switch (value) {
        case 'wallet':
          choice = value;
          break;
        case 'razorpay':
          choice = value;
          break;
        case 'delivery':
          choice = value;
          break;
        default:
          choice = null;
      }
      debugPrint(choice); //Debug the choice in console
    });
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
                    'Payment Methods',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(
                      image: iconsBell,
                      callBack: () {
                        Get.to(() => const NotificationScreen());
                      })),
              height20,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select the payment method you want to use.',
                    style: AppFontStyle.greyOpenSans14W400,
                  ),
                  customHeight(15),
                  Text(
                    'Payment Options',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  height16,
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16)
                              .copyWith(right: 4),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: offWhite)),
                          child: Row(
                            children: [
                              Image(image: iconsWallet),
                              customWidth(08),
                              Text(
                                "Wallet",
                                style: AppFontStyle.blackOpenSans12W500,
                              ),
                              const Spacer(),
                              Radio(
                                fillColor: MaterialStateProperty.all(colorPrimary),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                value: 'wallet',
                                groupValue: radioValue,
                                activeColor: Colors.blue,
                                onChanged: radioButtonChanges,
                              ),
                            ],
                          ),
                        ),
                        customHeight(08),
                        Obx(() {
                          return CustomExpansionPanelList(
                            expansionCallback: (int index, bool isExpanded) {
                              isExpand.value = !isExpanded;
                              isExpand.refresh();
                            },
                            children:
                                subscriptionDesList.map<ExpansionPanel>((SubscriptionItem item) {
                              return ExpansionPanel(
                                backgroundColor: item.isExpanded ? colorPrimary : offWhite,
                                canTapOnHeader: false,
                                headerBuilder: (BuildContext context, bool isExpanded) {
                                  return GestureDetector(
                                    onTap: () {
                                      isExpand.value = !isExpanded;
                                      isExpand.refresh();
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            minVerticalPadding: 0,
                                            visualDensity: const VisualDensity(
                                                horizontal: VisualDensity.minimumDensity,
                                                vertical: VisualDensity.minimumDensity),
                                            leading: Image(
                                              image: iconsBank,
                                            ),
                                            title: Text('Net Banking',
                                                style: AppFontStyle.blackOpenSans14W500),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                body: Column(children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5.0, horizontal: 16)
                                            .copyWith(right: 4),
                                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                        border: Border.all(color: offWhite)),
                                    child: Row(
                                      children: [
                                        Image(image: iconsRazorPay),
                                        customWidth(08),
                                        Text(
                                          "RazorPay",
                                          style: AppFontStyle.blackOpenSans12W500,
                                        ),
                                        const Spacer(),
                                        Radio(
                                          fillColor: MaterialStateProperty.all(colorPrimary),
                                          visualDensity: const VisualDensity(
                                              horizontal: VisualDensity.minimumDensity,
                                              vertical: VisualDensity.minimumDensity),
                                          value: 'razorpay',
                                          groupValue: radioValue,
                                          activeColor: Colors.blue,
                                          onChanged: radioButtonChanges,
                                        ),
                                      ],
                                    ),
                                  ),
                                  customHeight(10),
                                ]),
                                isExpanded: isExpand.value,
                              );
                            }).toList(),
                          );
                        }),
                        customHeight(08),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16)
                              .copyWith(right: 4),
                          decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                              border: Border.all(color: offWhite)),
                          child: Row(
                            children: [
                              Image(image: iconsMoneys),
                              customWidth(08),
                              Text(
                                "Cash on Delivery",
                                style: AppFontStyle.blackOpenSans12W500,
                              ),
                              const Spacer(),
                              Radio(
                                fillColor: MaterialStateProperty.all(colorPrimary),
                                visualDensity: const VisualDensity(
                                    horizontal: VisualDensity.minimumDensity,
                                    vertical: VisualDensity.minimumDensity),
                                value: 'delivery',
                                groupValue: radioValue,
                                activeColor: Colors.blue,
                                onChanged: radioButtonChanges,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ).paddingSymmetric(horizontal: 20),
              const Spacer(),
              commonFilledButton(
                      onTap: () {
                        Get.to(() => const OrderSuccessScreen());
                      },
                      title: 'Confirm Payment')
                  .paddingSymmetric(horizontal: 20, vertical: 44)
            ],
          ),
        ));
  }
}
