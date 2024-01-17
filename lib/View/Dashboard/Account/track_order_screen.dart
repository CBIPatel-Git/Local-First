import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../Utility/utility_export.dart';

class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {
  RxBool waiteItem = true.obs;
  RxBool checkDeliveredItem = true.obs;
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 16,
  );
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  void onMapCreated(GoogleMapController controller) {
    var marker = const Marker(
      markerId: MarkerId('place_name'),
      position: LatLng(37.42796133580664, -122.085749655962),
      infoWindow: InfoWindow(
        title: 'title',
        snippet: 'address',
      ),
    );
    _controller.complete(controller);
    setState(() {
      markers[const MarkerId('place_name')] = marker;
    });
  }

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
                    'Track Order',
                    style: AppFontStyle.blackOpenSans16W600,
                  ),
                  sufFix: appBarButton(image: iconsBell, callBack: () {})),
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: _kGooglePlex,
                        zoomControlsEnabled: false,
                        myLocationButtonEnabled: false,
                        markers: markers.values.toSet(),
                        onMapCreated: onMapCreated),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                        decoration: const BoxDecoration(
                            color: colorPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(12))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(07),
                                    child: Image(
                                      image: imagesDeliveryUser,
                                      fit: BoxFit.cover,
                                    )),
                                width10,
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'delivery executive',
                                      style:
                                          AppFontStyle.blackOpenSans12W400.copyWith(color: white),
                                    ),
                                    Text(
                                      'Leslie Alexander',
                                      style:
                                          AppFontStyle.blackOpenSans16W600.copyWith(color: white),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Image(
                                  image: iconsMessage,
                                  fit: BoxFit.cover,
                                ),
                                width12,
                                Image(
                                  image: iconsCall,
                                  fit: BoxFit.cover,
                                ),
                              ],
                            ).paddingSymmetric(horizontal: 8.0).paddingOnly(top: 8),
                            height10,
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 21),
                              decoration: const BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.all(Radius.circular(12))),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Checkbox(
                                                value: true,
                                                activeColor: colorPrimary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5)),
                                                side: BorderSide.none,
                                                fillColor: MaterialStateProperty.all(colorPrimary),
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize.shrinkWrap,
                                                onChanged: (value) {},
                                                visualDensity: const VisualDensity(
                                                    vertical: VisualDensity.minimumDensity,
                                                    horizontal: VisualDensity.minimumDensity),
                                              ),
                                            ),
                                            width16,
                                            Text(
                                              'Order Confirmed',
                                              style: AppFontStyle.blackOpenSans14W600,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: DottedLine(
                                              direction: Axis.vertical,
                                              alignment: WrapAlignment.center,
                                              lineLength: double.infinity,
                                              lineThickness: 2.0,
                                              dashLength: 5.0,
                                              dashColor: colorPrimary,
                                              dashRadius: 0.0,
                                              dashGapLength: 4.0,
                                              dashGapColor: Colors.transparent,
                                              dashGapRadius: 0.0,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            waiteItem.value == false
                                                ? SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Checkbox(
                                                      value: true,
                                                      activeColor: colorPrimary,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5)),
                                                      side: BorderSide.none,
                                                      fillColor:
                                                          MaterialStateProperty.all(colorPrimary),
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize.shrinkWrap,
                                                      onChanged: (value) {},
                                                      visualDensity: const VisualDensity(
                                                          vertical: VisualDensity.minimumDensity,
                                                          horizontal: VisualDensity.minimumDensity),
                                                    ),
                                                  )
                                                : checkDeliveredItem.value == true
                                                    ? Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: const BoxDecoration(
                                                            color: colorPrimary,
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(5))),
                                                        child: Image(
                                                          image: iconsProcess,
                                                        ),
                                                      )
                                                    : commonCheckBoxContainer(),
                                            width16,
                                            Text(
                                              'Food is ready at the restaurant ',
                                              style: AppFontStyle.blackOpenSans14W600,
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: DottedLine(
                                              direction: Axis.vertical,
                                              alignment: WrapAlignment.center,
                                              lineLength: double.infinity,
                                              lineThickness: 2.0,
                                              dashLength: 5.0,
                                              dashColor: colorPrimary,
                                              dashRadius: 0.0,
                                              dashGapLength: 4.0,
                                              dashGapColor: Colors.transparent,
                                              dashGapRadius: 0.0,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            waiteItem.value == false
                                                ? SizedBox(
                                                    height: 20,
                                                    width: 20,
                                                    child: Checkbox(
                                                      value: true,
                                                      activeColor: colorPrimary,
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(5)),
                                                      side: BorderSide.none,
                                                      fillColor:
                                                          MaterialStateProperty.all(colorPrimary),
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize.shrinkWrap,
                                                      onChanged: (value) {},
                                                      visualDensity: const VisualDensity(
                                                          vertical: VisualDensity.minimumDensity,
                                                          horizontal: VisualDensity.minimumDensity),
                                                    ),
                                                  )
                                                : checkDeliveredItem.value == true
                                                    ? Container(
                                                        height: 20,
                                                        width: 20,
                                                        decoration: const BoxDecoration(
                                                            color: colorPrimary,
                                                            borderRadius: BorderRadius.all(
                                                                Radius.circular(5))),
                                                        child: Image(
                                                          image: iconsProcess,
                                                        ),
                                                      )
                                                    : commonCheckBoxContainer(),
                                            width16,
                                            Text(
                                              'Order is coming at to you ',
                                              style: AppFontStyle.blackOpenSans14W600
                                                  .copyWith(color: colorPrimary),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 20,
                                          child: Padding(
                                            padding: EdgeInsets.only(left: 10.0),
                                            child: DottedLine(
                                              direction: Axis.vertical,
                                              alignment: WrapAlignment.center,
                                              lineLength: double.infinity,
                                              lineThickness: 2.0,
                                              dashLength: 5.0,
                                              dashColor: colorPrimary,
                                              dashRadius: 0.0,
                                              dashGapLength: 4.0,
                                              dashGapColor: Colors.transparent,
                                              dashGapRadius: 0.0,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              height: 20,
                                              width: 20,
                                              child: Checkbox(
                                                value: true,
                                                activeColor: colorPrimary,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(5)),
                                                side: BorderSide.none,
                                                fillColor: MaterialStateProperty.all(colorPrimary),
                                                materialTapTargetSize:
                                                    MaterialTapTargetSize.shrinkWrap,
                                                onChanged: (value) {},
                                                visualDensity: const VisualDensity(
                                                    vertical: VisualDensity.minimumDensity,
                                                    horizontal: VisualDensity.minimumDensity),
                                              ),
                                            ),
                                            width16,
                                            Text(
                                              'Order delivered',
                                              style: AppFontStyle.blackOpenSans14W600,
                                            )
                                          ],
                                        ),
                                        height24,
                                        const Divider(),
                                        height10,
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Image(image: iconsTimer),
                                                width10,
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Arrived in',
                                                      style: AppFontStyle.greyOpenSans12W600,
                                                    ),
                                                    RichText(
                                                      maxLines: 2,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: '09:13 ',
                                                            style: AppFontStyle.blackOpenSans16W600
                                                                .copyWith(
                                                                    fontWeight: FontWeight.w700)),
                                                        TextSpan(
                                                            text: 'Mins',
                                                            style: AppFontStyle.blackOpenSans12W600
                                                                .copyWith(
                                                                    fontWeight: FontWeight.w700)),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                const Icon(Icons.location_on_rounded, size: 30),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Deliver to',
                                                      style: AppFontStyle.greyOpenSans12W600,
                                                    ),
                                                    RichText(
                                                      maxLines: 2,
                                                      text: TextSpan(children: [
                                                        TextSpan(
                                                            text: 'Vadodara,',
                                                            style: AppFontStyle.blackOpenSans16W600
                                                                .copyWith(
                                                                    fontWeight: FontWeight.w700)),
                                                        TextSpan(
                                                            text: ' Gujarat',
                                                            style: AppFontStyle.blackOpenSans12W600
                                                                .copyWith(
                                                                    fontWeight: FontWeight.w700)),
                                                      ]),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
