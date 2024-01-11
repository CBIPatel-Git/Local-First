import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:local_first/View/Home/home_screen.dart';

import '../../Utility/utility_export.dart';
import '../../generated/assets.dart';

class MapScreen extends StatefulWidget {
  double lat;
  double long;

  MapScreen({super.key, required this.lat, required this.long});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late BitmapDescriptor icons;

  @override
  void initState() {
    getIcons();
    super.initState();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 16,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              zoomControlsEnabled: false,
              myLocationButtonEnabled: false,
              markers: markers.values.toSet(),
              onMapCreated: onMapCreated),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            child: commonTextField(
                hintText: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                textEditingController: searchController,
                preFixIcon: iconsSearchBackIcon,
                prefixIconTap: () {
                  Get.back();
                },
                suffixIcon: const Icon(Icons.close_rounded)),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
                child: commonFilledButton(
                    onTap: () {
                      Get.offAll(() => const HomeScreen());
                    },
                    title: 'Done'),
              ))
        ],
      ),
    );
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 4), Assets.iconsMarkerIcon);
    setState(() {
      icons = icon;
    });
  }

  void onMapCreated(GoogleMapController controller) {
    var marker = Marker(
      markerId: const MarkerId('place_name'),
      position: const LatLng(37.42796133580664, -122.085749655962),
      icon: icons,
      infoWindow: const InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    _controller.complete(controller);
    setState(() {
      markers[const MarkerId('place_name')] = marker;
    });
  }
}
