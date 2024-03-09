import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
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
  TextEditingController? searchController;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  MarkerId markerId = const MarkerId("markerId");
  late BitmapDescriptor icons;

  late GoogleMapController mapController;
  double destLatitude = 21.7362, destLongitude = 72.135925;

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAHKno9ZmWWbMM8tBpQ27p6JHCmoSF62BA";
  Position? currentPosition;
  LatLng? markerPosition;
  Marker? marker;
  String? currentAddress;

  @override
  void initState() {
    getIcons();

    getCurrentLocation().then((value) => {
          setState(() {
            _addMarker(
                LatLng(currentPosition?.latitude ?? destLatitude,
                    currentPosition?.longitude ?? destLongitude),
                "origin",
                icons);
          }),
        });

    searchController = TextEditingController(text: currentAddress ?? '');

    // /// destination marker
    // _addMarker(LatLng(_destLatitude, _destLongitude), "destination",
    //     BitmapDescriptor.defaultMarkerWithHue(90));

    // _getPolyline();
    super.initState();
  }

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
            initialCameraPosition: CameraPosition(
              target: LatLng(currentPosition?.latitude ?? destLatitude,
                  currentPosition?.longitude ?? destLongitude),
              zoom: 16,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            markers: marker != null ? {marker!} : Set<Marker>.of(markers.values),
            onMapCreated: _onMapCreated,
            onTap: handleTap,
            // onMapCreated: onMapCreated,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: commonTextField(
                hintText: '1901 Thornridge Cir. Shiloh, Hawaii 81063',
                textEditingController: searchController,
                preFixIcon: iconsSearchBackIcon,
                initialText: currentAddress,
                inputAction: TextInputAction.go,
                onFieldSubmitted: (value) {
                  _searchAddress();
                },
                prefixIconTap: () {
                  Get.back();
                },
                suffixIcon: GestureDetector(
                    onTap: searchController?.clear, child: const Icon(Icons.close_rounded))),
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
      target: LatLng(
          currentPosition?.latitude ?? destLatitude, currentPosition?.longitude ?? destLongitude),
      // target: LatLng(_destLatitude, _destLongitude),
      zoom: 14,
    )));

    _controller.complete(controller);
  }

  // void _onMapCreated(GoogleMapController controller) {
  //   setState(() {
  //     mapController = controller;
  //   });
  // }

  Future<void> _searchAddress() async {
    // Get the address from the text field
    List<Location> locations = await locationFromAddress(currentAddress ?? '');

    if (locations.isNotEmpty) {
      Location location = locations.first;
      LatLng newPosition = LatLng(location.latitude, location.longitude);

      if (mapController != null) {
        mapController.animateCamera(CameraUpdate.newLatLng(newPosition));
        setState(() {
          markerPosition = newPosition;
        });
      }
    } else {
      // Handle the case where no location is found for the given address
      print('No location found for the address.');
    }
  }

  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine() {
    PolylineId id = const PolylineId("poly");
    Polyline polyline = Polyline(polylineId: id, color: Colors.red, points: polylineCoordinates);
    polylines[id] = polyline;
    setState(() {});
  }

  _getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPiKey,
        PointLatLng(currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0),
        PointLatLng(destLatitude, destLongitude),
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

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        currentPosition = position;
      });

      final List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        final Placemark place = placemarks.first;
        setAddress(place);
      }

      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 15.0,
            ),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  void handleTap(LatLng position) async {
    setState(() {
      markers = {};
    });

    final List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      final Placemark place = placemarks.first;
      // final String address = "${placemark.subThoroughfare} ${placemark.thoroughfare}, "
      //     "${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, "
      //     "${placemark.country}";

      setAddress(place);

      setState(() {
        markerPosition = position;
        marker = Marker(
          markerId: markerId,
          position: position,
          infoWindow: InfoWindow(title: 'Marker Location', snippet: currentAddress),
          draggable: true,
          icon: icons,
          onDragEnd: (newPosition) => _onMarkerDragEnd(newPosition),
        );
      });

      if (mapController != null) {
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: position,
              zoom: 15.0,
            ),
          ),
        );
      }
    }
  }

  void _onMarkerDragEnd(LatLng newPosition) async {
    final List<Placemark> placemarks = await placemarkFromCoordinates(
      newPosition.latitude,
      newPosition.longitude,
    );

    if (placemarks.isNotEmpty) {
      final Placemark placemark = placemarks.first;
      final String address = "${placemark.subThoroughfare} ${placemark.thoroughfare}, "
          "${placemark.locality}, ${placemark.administrativeArea} ${placemark.postalCode}, "
          "${placemark.country}";

      print("Dragged address: $address");
    }
  }

  void setAddress(Placemark place) {
    String address = '';
    if (place.name != null && place.name?.isNotEmpty == true) {
      address += '${place.name}, ';
    }
    if (place.subThoroughfare != null && place.subThoroughfare?.isNotEmpty == true) {
      address += '${place.subThoroughfare}, ';
    }
    if (place.thoroughfare != null && place.thoroughfare?.isNotEmpty == true) {
      address += '${place.thoroughfare}, ';
    }
    if (place.subLocality != null && place.subLocality?.isNotEmpty == true) {
      address += '${place.subLocality}, ';
    }
    if (place.locality != null && place.locality?.isNotEmpty == true) {
      address += '${place.locality}, ';
    }
    if (place.postalCode != null && place.postalCode?.isNotEmpty == true) {
      address += '${place.postalCode}, ';
    }
    if (place.country != null && place.country?.isNotEmpty == true) {
      address += '${place.country}';
    }
    setState(() {
      currentAddress = address;
      print("Clicked address: $currentAddress");
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
