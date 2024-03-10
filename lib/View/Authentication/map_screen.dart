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
  String? address;
  bool isManually;

  MapScreen({super.key, this.lat, this.long, this.address, required this.isManually});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  TextEditingController? searchController;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  late BitmapDescriptor? icons;

  late GoogleMapController? mapController;
  MarkerId markerId = const MarkerId("markerId");

  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  String googleAPiKey = "AIzaSyAHKno9ZmWWbMM8tBpQ27p6JHCmoSF62BA";
  Position? currentPosition;
  LatLng? markerPosition;
  Marker? marker;
  String? currentAddress = '';

  double initLat = 21.7645;
  double initLng = 72.1519;

  @override
  void initState() {
    getIcons().then((value) {
      if (widget.isManually) {
        if (widget.isManually) {
          initLat = widget.lat ?? 21.7645;
          initLng = widget.long ?? 72.1519;
          _addMarker(LatLng(initLat, initLng), "origin", icons!);
        }
      } else {
        getCurrentLocation().then((value) => {
              setState(() {
                _addMarker(
                    LatLng(currentPosition?.latitude ?? initLat,
                        currentPosition?.longitude ?? initLng),
                    "origin",
                    icons!);
              }),
            });
        searchController = TextEditingController(text: currentAddress ?? '');
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: widget.isManually
                  ? LatLng(initLat, initLng)
                  : LatLng(
                      currentPosition?.latitude ?? initLat, currentPosition?.longitude ?? initLng),
              zoom: widget.isManually ? 10 : 16,
            ),
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            markers: marker != null ? {marker!} : Set<Marker>.of(markers.values),
            onMapCreated: _onMapCreated,
            onTap: widget.isManually ? (e) {} : handleTap,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 60),
            child: commonTextField(
                hintText: widget.isManually ? '${widget.address}' : "Search",
                textEditingController: searchController,
                preFixIcon: iconsSearchBackIcon,
                initialText: widget.isManually ? widget.address : currentAddress ?? '',
                inputAction: TextInputAction.go,
                onTapFunction: widget.isManually
                    ? () {
                        Get.back();
                      }
                    : () {},
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

  _onMapCreated(GoogleMapController controller) async {
    mapController = controller;

    if (widget.isManually) {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          // on below line we have given positions of Location 5
          CameraPosition(target: LatLng(initLat, initLng), zoom: 14)));
    } else {
      mapController?.animateCamera(CameraUpdate.newCameraPosition(
          // on below line we have given positions of Location 5
          CameraPosition(
        target: LatLng(currentPosition?.latitude ?? initLat, currentPosition?.longitude ?? initLng),
        // target: LatLng(_destLatitude, _destLongitude),
        zoom: 14,
      )));
    }

    _controller.complete(controller);
  }

  Future<void> _searchAddress() async {
    // Get the address from the text field
    List<Location> locations = await locationFromAddress(currentAddress ?? '');

    if (locations.isNotEmpty) {
      Location location = locations.first;
      LatLng newPosition = LatLng(location.latitude, location.longitude);

      if (mapController != null) {
        mapController?.animateCamera(CameraUpdate.newLatLng(newPosition));
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
    double destLatitude = 21.7362, destLongitude = 72.135925;
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

  Future getIcons() async {
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

      final mapController = this.mapController;
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
      setAddress(place);

      setState(() {
        markerPosition = position;
        marker = Marker(
          markerId: markerId,
          position: position,
          infoWindow: InfoWindow(title: 'Marker Location', snippet: currentAddress),
          draggable: true,
          icon: icons!,
        );
      });

      final mapController = this.mapController;
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
}
