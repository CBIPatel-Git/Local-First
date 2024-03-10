import '../../CustomWidget/bar_chart.dart';
import '../../Utility/utility_export.dart';

class VDashboardScreen extends StatefulWidget {
  const VDashboardScreen({super.key});

  @override
  State<VDashboardScreen> createState() => _VDashboardScreenState();
}

class _VDashboardScreenState extends State<VDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return commonStructure(
      context: context,
      child: SafeArea(
        child: Column(
          children: [
            commonAppBar(
                preFix: const SizedBox(
                  height: 40,
                  width: 40,
                ),
                title: Text(
                  'Dashboard',
                  style: AppFontStyle.blackOpenSans18W600,
                ),
                sufFix: appBarButton(image: iconsInfo, callBack: () {})),
            Expanded(
              child: Container(
                color: offWhite,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  children: [
                    height14,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonContainer(
                            text: 'My Balance', subText: '\$95,69013213', image: imagesMoney),
                        commonContainer(text: 'Expense', subText: '\$4,854', image: imagesMedical),
                      ],
                    ),
                    height16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        commonContainer(
                            text: 'Total Saving', subText: '\$74,500', image: imagesSaving),
                        commonContainer(text: 'Income', subText: '\$1,900', image: imagesIncome),
                      ],
                    ),
                    height20,
                    Text(
                      'Sales Comparisons',
                      style: AppFontStyle.blackOpenSans16W600,
                    ),
                    height12,
                    Container(
                        height: 275,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        child: BarChartSample2(flag: 'chart1')),
                    height20,
                    Text(
                      'Weekly Activity',
                      style: AppFontStyle.blackOpenSans16W600,
                    ),
                    height12,
                    Container(
                        height: 275,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(15.0))),
                        child: BarChartSample2(flag: 'chart2')),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  commonContainer({String? text, String? subText, ExactAssetImage? image}) {
    return Container(
      padding: const EdgeInsets.only(left: 16),
      width: 170,
      height: 85,
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      child: Row(
        children: [
          Image(image: image!),
          width10,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text!,
                  style: AppFontStyle.greyOpenSans12W400,
                ).paddingOnly(right: 5),
                Text(subText!, style: AppFontStyle.blackOpenSans16W600),
              ],
            ),
          )
        ],
      ),
    );
  }
}
