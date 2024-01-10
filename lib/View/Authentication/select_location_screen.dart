import 'package:local_first/View/Authentication/map_screen.dart';

import '../../Utility/utility_export.dart';
import '../../generated/assets.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        bgColor: white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Image.asset(
              Assets.iconsBackIcon,
              scale: 4,
            ),
          ),
          title: Text(
            'Select Location',
            style: AppFontStyle.blackOpenSans18W600,
          ),
          centerTitle: true,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              commonTextField(
                  hintText: 'Search location',
                  hintStyle: AppFontStyle.greyOpenSans14W400,
                  textEditingController: textEditingController,
                  preFixIcon:
                      const ExactAssetImage(Assets.iconsSearchIcon, scale: 4),
                  suffixIcon: Image.asset(
                    Assets.iconsGpsIcon,
                    scale: 4,
                  )),
              customHeight(18),
              Expanded(
                child: ListView.separated(
                    itemCount: 2,
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 0.5,
                      );
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Get.to(() => MapScreen(lat: 2.30, long: 203.0));
                        },
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: black.withOpacity(0.1)),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(100.0),
                            ),
                          ),
                          child: Image.asset(
                            Assets.iconsLocationIcon,
                            scale: 4,
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Allentown',
                              style: AppFontStyle.blackOpenSans12W500,
                            ),
                            Text(
                              '5.5 KM Away',
                              style: AppFontStyle.blackOpenSans12W500,
                            )
                          ],
                        ),
                        subtitle: Text(
                          '2118 Thornridge Cir. Syracuse, Connecticut 35624',
                          style: AppFontStyle.greyOpenSans12W500,
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }
}
