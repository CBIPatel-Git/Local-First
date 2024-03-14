import 'package:local_first/View/Authentication/map_screen.dart';

import '../../Models/AuthenticationModel/select_location_model.dart';
import '../../Utility/utility_export.dart';
import '../../generated/assets.dart';

class SelectLocationScreen extends StatefulWidget {


  SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  TextEditingController textEditingController = TextEditingController();
  List<SelectLocationModelDataLocationResults>? results;

  @override
  Widget build(BuildContext context) {
    results = kAuthenticationController.selectLocationModel.value.data?.location?.results
        ?.cast<SelectLocationModelDataLocationResults>();
    return commonStructure(
        context: context,
        bgColor: white,
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
                    'Select Location',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: const SizedBox(height: 40,width: 40,)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      commonTextField(
                          hintText: 'Search location',
                          hintStyle: AppFontStyle.greyOpenSans14W400,
                          textEditingController: textEditingController,
                          preFixIcon: const ExactAssetImage(Assets.iconsSearchIcon, scale: 4),
                          suffixIcon: Image.asset(
                            Assets.iconsGpsIcon,
                            scale: 4,
                          )),
                      customHeight(18),
                      Expanded(
                        child: ListView.separated(
                            itemCount: results?.length ?? 0,
                            shrinkWrap: true,
                            separatorBuilder: (context, index) {
                              return const Divider(
                                thickness: 0.5,
                              );
                            },
                            itemBuilder: (context, index) {
                              return ListTile(
                                onTap: () {
                                  Get.to(() => MapScreen(
                                      isManually : false,
                                      lat: results?[index].geometry?.location?.lat,
                                      long: results?[index].geometry?.location?.lng,
                                      address: results?[index].formattedAddress ?? ''));
                                },
                                contentPadding: EdgeInsets.zero,
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 1, color: black.withOpacity(0.1)),
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
                                  '${results?[index].formattedAddress}',
                                  style: AppFontStyle.greyOpenSans12W500,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
