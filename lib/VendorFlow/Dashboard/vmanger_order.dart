import 'package:dotted_line/dotted_line.dart';

import '../../Utility/utility_export.dart';

class VMangerOrderScreen extends StatefulWidget {
  const VMangerOrderScreen({super.key});

  @override
  State<VMangerOrderScreen> createState() => _VMangerOrderScreenState();
}

class _VMangerOrderScreenState extends State<VMangerOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonAppBar(
                preFix: const SizedBox(
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  'Mange Order',
                  style: AppFontStyle.blackOpenSans18W600,
                ),
                sufFix: appBarButton(image: iconsInfo, callBack: () {})),
            Text(
              '50 Orders',
              style: AppFontStyle.greyOpenSans14W500,
            ).paddingOnly(left: 16),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  padding: const EdgeInsets.only(bottom: 20),
                  itemBuilder: (_, index) {
                    return commonCartBackground(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(image: imagesCategoryProduct1),
                            width16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'SAMSUNG Galaxy M34 5G (Prism Silver, 128 GB)',
                                    maxLines: 2,
                                    style: AppFontStyle.blackOpenSans14W600,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  customHeight(08),
                                  Text(
                                    'Selling Price: ${'\$233'}',
                                    style: AppFontStyle.greyOpenSans14W500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Item Id: ${'1169887585381438468'}',
                                    style: AppFontStyle.greyOpenSans14W500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Order ID: ${'OD65584846565745741'}',
                                    style: AppFontStyle.greyOpenSans14W500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Order Date: ${'Aug 32, 2:15 pm'}',
                                    style: AppFontStyle.greyOpenSans14W500,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        height14,
                        const Divider(
                          thickness: 1,
                        ),
                        customHeight(09),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Order Type',
                                  style: AppFontStyle.greyOpenSans14W400,
                                ),
                                Text(
                                  'Replacement',
                                  style: AppFontStyle.blackOpenSans14W600,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 41,
                              child: DottedLine(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.center,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 5.0,
                                dashColor: cardBorder,
                                dashRadius: 0.0,
                                dashGapLength: 1.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Quantity',
                                  style: AppFontStyle.greyOpenSans14W400,
                                ),
                                Text(
                                  '2 units',
                                  style: AppFontStyle.blackOpenSans14W600,
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 41,
                              child: DottedLine(
                                direction: Axis.vertical,
                                alignment: WrapAlignment.center,
                                lineLength: double.infinity,
                                lineThickness: 1.0,
                                dashLength: 5.0,
                                dashColor: cardBorder,
                                dashRadius: 0.0,
                                dashGapLength: 1.0,
                                dashGapColor: Colors.transparent,
                                dashGapRadius: 0.0,
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Dispatch By',
                                  style: AppFontStyle.greyOpenSans14W400,
                                ),
                                Text(
                                  'Sep 1, 2:15 pm',
                                  style: AppFontStyle.blackOpenSans14W600,
                                ),
                              ],
                            ),
                          ],
                        ),
                        height12,
                        Row(
                          children: [
                            Container(
                              height: 38,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: cardBorder, width: 1)),
                              child: Center(
                                child: Text(
                                  'Regular',
                                  style: AppFontStyle.blackOpenSans14W500,
                                ),
                              ),
                            ),
                            width14,
                            Container(
                              height: 38,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: colorPrimary2.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: colorPrimary2, width: 1)),
                              child: Center(
                                child: Text(
                                  'Prepaid',
                                  style: AppFontStyle.blackOpenSans14W500,
                                ),
                              ),
                            ),
                            width14,
                            Container(
                              height: 38,
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  color: litePurple.withOpacity(0.10),
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(color: litePurple, width: 1)),
                              child: Center(
                                child: Text(
                                  'Pending',
                                  style: AppFontStyle.blackOpenSans14W500,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ));
                  }),
            ),
          ],
        ),
      ),
      context: context,
    );
  }
}

commonCartBackground({Widget? child}) {
  return Container(
    padding: const EdgeInsets.all(10.0),
    margin: const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 16),
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
    child: child,
  );
}
