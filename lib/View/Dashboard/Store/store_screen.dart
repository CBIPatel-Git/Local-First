import 'package:flutter/cupertino.dart';
import 'package:local_first/View/Dashboard/Store/store_detail_screen.dart';

import '../../../Utility/utility_export.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
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
                  sufFix: appBarButton(image: iconsNotification, callBack: () {}),
                  title: Text(
                    'Store',
                    style: AppFontStyle.blackOpenSans18W600,
                  )),
              height10,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Near by store',
                  style: AppFontStyle.blackOpenSans16W600,
                ),
              ),
              height10,
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 10, right: 20, bottom: 100),
                  itemBuilder: (context, index) {
                    return InkWell(
                      highlightColor: white,
                      splashColor: white,
                      onTap: () {
                        Get.to(() => const StoreDetailScreen());
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 183,
                            margin: const EdgeInsets.only(top: 7, bottom: 7, left: 10),
                            decoration: BoxDecoration(
                                border: Border.all(color: cardBorder, width: 1),
                                borderRadius: BorderRadius.circular(12)),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Stack(
                                      children: [
                                        SizedBox(
                                          height: 120,
                                          width: getScreenWidth(context),
                                          child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                  topRight: Radius.circular(12)),
                                              child: Image(
                                                image: imagesNearbyStore,
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Align(
                                            alignment: Alignment.topRight,
                                            child: Icon(
                                              CupertinoIcons.heart,
                                              size: 24,
                                              color: white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'The Stylish Satchel',
                                                style: AppFontStyle.blackOpenSans16W600,
                                              ),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.star,
                                                    size: 17,
                                                    color: colorPrimary,
                                                  ),
                                                  width05,
                                                  Text(
                                                    '4.0 (2.4K) • Delivery • 2.2Km',
                                                    style: AppFontStyle.greyOpenSans12W400,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Text(
                                                '\$0 Delivery',
                                                style: AppFontStyle.blackOpenSans12W500
                                                    .copyWith(color: colorPrimary2),
                                              ),
                                              height05,
                                              Text('Closes 10:30am',
                                                  style: AppFontStyle.blackOpenSans12W400
                                                      .copyWith(color: red)),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          if (index == 1)
                            Container(
                                margin: const EdgeInsets.only(top: 25),
                                child: Image(image: imagesOfferBanner)),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
