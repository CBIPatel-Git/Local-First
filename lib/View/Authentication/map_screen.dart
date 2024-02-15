import 'dart:async';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../Utility/utility_export.dart';
import '../../generated/assets.dart';
import '../Dashboard/bottom_navigation_screen.dart';

class MapScreen extends StatefulWidget {
  double? lat;
  double? long;

  MapScreen({super.key, this.lat, this.long});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  TextEditingController searchController = TextEditingController();
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late BitmapDescriptor icons;

  late GoogleMapController mapController;
  double _originLatitude = 21.2346472, _originLongitude = 72.8770518;
  double _destLatitude = 21.7362, _destLongitude = 72.135925;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAHKno9ZmWWbMM8tBpQ27p6JHCmoSF62BA";

  @override
  void initState() {
    getIcons();
    super.initState();

    _addMarker(LatLng(_originLatitude, _originLongitude), "origin", BitmapDescriptor.defaultMarker);

    /// destination marker
    _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
        BitmapDescriptor.defaultMarkerWithHue(90));

    _getPolyline();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(21.2346472, 72.8770518),
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
            onMapCreated: _onMapCreated,
            // onMapCreated: onMapCreated,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
                child: commonFilledButton(
                    onTap: () {
                      Get.offAll(() => const BottomNavigationScreen());
                    },
                    title: 'Done'),
              ))
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    mapController.animateCamera(CameraUpdate.newCameraPosition(
      // on below line we have given positions of Location 5
        CameraPosition(
          target: LatLng(_originLatitude, _originLongitude),
          // target: LatLng(_destLatitude, _destLongitude),
          zoom: 14,
        )
    ));

    _controller.complete(controller);
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(googleAPiKey,
        PointLatLng(_originLatitude, _originLongitude), PointLatLng(_destLatitude, _destLongitude),
        travelMode: TravelMode.driving,
        wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]);
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }
    _addPolyLine();
  }

  getIcons() async {
    var icon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 4), Assets.iconsMarkerIcon);
    setState(() {
      icons = icon;
    });
  }

// void onMapCreated(GoogleMapController controller) {
//   var marker = Marker(
//     markerId: const MarkerId('place_name'),
//     position: const LatLng(37.42796133580664, -122.085749655962),
//     icon: icons,
//     infoWindow: const InfoWindow(
//       title: 'title',
//       snippet: 'address',
//     ),
//   );
//   _controller.complete(controller);
//   setState(() {
//     markers[const MarkerId('place_name')] = marker;
//   });
// }
}
