import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_first/View/Authentication/select_location_screen.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Utility/utility_export.dart';
import 'map_screen.dart';

class LocationAccessScreen extends StatefulWidget {
  const LocationAccessScreen({super.key});

  @override
  State<LocationAccessScreen> createState() => _LocationAccessScreenState();
}

class _LocationAccessScreenState extends State<LocationAccessScreen> {
  LocationPermission? permission;
  String? currentAddress = '';
  Position? currentPosition;
  late GoogleMapController? mapController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    grandPermission();
  }

  Future<void> grandPermission() async {
    permission = await Geolocator.requestPermission();
  }

  @override
  Widget build(BuildContext context) {
    return commonStructure(
        context: context,
        child: Stack(
          children: [
            Image(
              image: imagesBg1,
              fit: BoxFit.cover,
              width: getScreenWidth(context),
              height: getScreenHeight(context),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    customHeight(55),
                    Text(
                      'Location access',
                      style: AppFontStyle.blackOpenSans18W600,
                    ),
                    customHeight(62),
                    Center(child: Image(image: imagesAccessLocation)),
                    customHeight(51),
                    Text(
                      'Grant Current location',
                      style: AppFontStyle.blackOpenSans22W600.copyWith(fontSize: 24),
                    ),
                    customHeight(8),
                    Text(
                      'This let us show nearby store, you can\n order from',
                      style: AppFontStyle.greyOpenSans14W400,
                      textAlign: TextAlign.center,
                    ),
                    customHeight(30),
                    commonFilledButton(
                      onTap: () async {
                        if (permission == LocationPermission.denied) {
                          permission = await Geolocator.requestPermission();
                        }

                        Position position = await Geolocator.getCurrentPosition(
                            desiredAccuracy: LocationAccuracy.low);
                        print(position.latitude);
                        print(position.longitude);

                        Map<String, dynamic> params = {
                          "latitude": position.latitude,
                          "longitude": position.longitude
                        };
                        kAuthenticationController.getLocationAPICall(params, () {
                          Get.to(() => const SelectLocationScreen());
                        });
                      },
                      title: 'Use current location',
                    ),
                    customHeight(30),
                    commonFilledButtonGrey(
                      onTap: () async {
                        if (await Permission.location.request().isGranted) {
                          Get.to(() => MapScreen(
                                isManually: false,
                              ));
                        } else {
                          openAppSettings();
                        }
                      },
                      title: 'Enter manually',
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
