import '../../../Utility/utility_export.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
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
                    'Notification',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: const SizedBox(),
                ),
                Row(
                  children: [
                    Text(
                      'New',
                      style: AppFontStyle.blackOpenSans16W600,
                    ).paddingOnly(left: 16),
                    width10,
                    ClipOval(
                      child: Container(
                        height: 25,
                        width: 25,
                        // padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: colorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          '2',
                          style: AppFontStyle.blackOpenSans12W600.copyWith(color: white),
                        )),
                      ),
                    )
                  ],
                ),
                commonList(
                  image: imagesTodayOffer1,
                  isOnline: true,
                  itemCount: 3,
                  offerText: '50% off ',
                  offerText2: 'and free delivery on your 1st order.',
                ),
                Row(
                  children: [
                    Text(
                      'Earlier',
                      style: AppFontStyle.blackOpenSans16W600,
                    ).paddingOnly(left: 16),
                    width10,
                    ClipOval(
                      child: Container(
                        height: 25,
                        width: 25,
                        // padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: colorPrimary,
                        ),
                        child: Center(
                            child: Text(
                          '2',
                          style: AppFontStyle.blackOpenSans12W600.copyWith(color: white),
                        )),
                      ),
                    )
                  ],
                ),
                commonList(
                  image: imagesTodayOffer1,
                  isOnline: false,
                  itemCount: 2,
                  offerText: '50% off ',
                  offerText2: 'and free delivery on your 1st order.',
                )
              ],
            ),
          ),
        ));
  }

  commonList(
      {int? itemCount,
      ExactAssetImage? image,
      String? offerText,
      String? offerText2,
      bool? isOnline}) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemCount,
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
        itemBuilder: (cxt, index) {
          return Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(
                    image: image!,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  )),
              width16,
              Expanded(
                child: RichText(
                  maxLines: 2,
                  text: TextSpan(children: [
                    TextSpan(text: offerText, style: AppFontStyle.blackOpenSans14W400),
                    TextSpan(text: offerText2, style: AppFontStyle.greyOpenSans14W500),
                  ]),
                ),
              ),
              Column(
                children: [
                  Text(
                    '5:37 PM',
                    style: AppFontStyle.greyOpenSans12W400,
                  ),
                  customHeight(08),
                  isOnline == true
                      ? ClipOval(
                          child: Container(
                            height: 8,
                            width: 8,
                            // padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: colorPrimary,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              )
            ],
          ).marginOnly(bottom: 24);
        });
  }
}
