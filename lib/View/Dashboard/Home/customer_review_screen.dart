import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../Utility/utility_export.dart';

class CustomerReviewScreen extends StatefulWidget {
  const CustomerReviewScreen({super.key});

  @override
  State<CustomerReviewScreen> createState() => _CustomerReviewScreenState();
}

class _CustomerReviewScreenState extends State<CustomerReviewScreen> {
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
                    'Customer Review',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsCart, callBack: () {})),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                '4.3',
                                style: AppFontStyle.blackOpenSans22W700.copyWith(fontSize: 30),
                              ),
                              width16,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4.5,
                                    minRating: 1,
                                    itemSize: 18,
                                    glowRadius: 10,
                                    ignoreGestures: true,
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
                                  customHeight(6),
                                  Text(
                                    '12,861 Ratings & 868 Reviews',
                                    style: AppFontStyle.greyOpenSans16W400,
                                  )
                                ],
                              ),
                              width10,
                            ],
                          ),
                          height25,
                          customHeight(8),
                          chartRow(context, '5', 89),
                          height16,
                          chartRow(context, '4', 8),
                          height16,
                          chartRow(context, '3', 3),
                          height16,
                          chartRow(context, '2', 5),
                          height16,
                          chartRow(context, '1', 3),
                          height25,
                          const Divider(thickness: 1),
                          height25,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Tap a star to Rate",
                                textAlign: TextAlign.center,
                                style: AppFontStyle.blackOpenSans18W700,
                              ),
                              height14,
                              RatingBar.builder(
                                initialRating: 4.5,
                                minRating: 1,
                                itemSize: 40,
                                glowRadius: 10,
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
                              height20,
                              Text(
                                "Write a review",
                                textAlign: TextAlign.center,
                                style:
                                    AppFontStyle.blackOpenSans16W600.copyWith(color: colorPrimary),
                              ),
                              height24,
                            ],
                          ),
                        ],
                      ).paddingSymmetric(horizontal: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Divider(
                            thickness: 10,
                            color: offWhite,
                          ),
                          height24,
                          Text(
                            '${25} Review',
                            style: AppFontStyle.greyOpenSans14W400,
                          ).paddingOnly(left: 16),
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: 5,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    height16,
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  const BorderRadius.all(Radius.circular(100)),
                                              child: Image(
                                                image: imagesProfilePicture,
                                                width: 48,
                                                height: 48,
                                              ),
                                            ),
                                            width16,
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text(
                                                        'James Lawson',
                                                        style: AppFontStyle.blackOpenSans14W600,
                                                      ),
                                                      Text(
                                                        '23 Jan 2024',
                                                        style: AppFontStyle.greyOpenSans12W400,
                                                      )
                                                    ],
                                                  ),
                                                  RatingBar.builder(
                                                    initialRating: 4.5,
                                                    minRating: 1,
                                                    itemSize: 18,
                                                    glowRadius: 10,
                                                    direction: Axis.horizontal,
                                                    allowHalfRating: true,
                                                    ignoreGestures: true,
                                                    itemCount: 5,
                                                    itemBuilder: (context, _) => const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                    ),
                                                    onRatingUpdate: (rating) {
                                                      print(rating);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        customHeight(07),
                                        Text(
                                          'Its too good. I always use samsung duento the quality, privacy and memory. But charger should also be given with the new mobile phone.',
                                          style: AppFontStyle.greyOpenSans12W400,
                                        ),
                                        height16,
                                        index == 5 - 1 ? const SizedBox() : const Divider()
                                      ],
                                    )
                                  ],
                                ).paddingSymmetric(horizontal: 20);
                              })
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text(label, style: AppFontStyle.greyOpenSans14W400),
        const SizedBox(width: 8),
        const Icon(Icons.star, color: colorPrimaryDark, size: 16),
        width10,
        Expanded(
          child: Stack(children: [
            Container(
              // width: MediaQuery.of(context).size.width * 0.6,
              width: getScreenWidth(context) * 0.8,
              height: 16,
              decoration: BoxDecoration(color: offWhite, borderRadius: BorderRadius.circular(8)),
              child: const Text(''),
            ),
            Container(
              width: MediaQuery.of(context).size.width * (pct / 100) * 0.7,
              height: 16,
              decoration: BoxDecoration(
                  color: label == "2"
                      ? colorPrimary
                      : label == "1"
                          ? red
                          : green,
                  borderRadius: BorderRadius.circular(4).copyWith(
                      topLeft: Radius.circular(pct == 1 ? 8 : 4),
                      bottomLeft: Radius.circular(pct == 1 ? 8 : 4))),
              child: const Text(''),
            ),
          ]),
        ),
        customWidth(8),
        Text('$pct%', style: AppFontStyle.greyOpenSans14W400),
      ],
    );
  }
}
