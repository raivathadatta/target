import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:spice_tracker/controller/target_controller.dart';
import 'package:spice_tracker/data/dependency_injection/inject.dart';
import 'package:spice_tracker/utils/app_colors.dart';

import '../../utils/images_loation.dart';
import '../widgets/Appbars/target_app_bar.dart';
import '../widgets/container/target_droup_down.dart';
import '../widgets/listitems/target_item.dart';
import 'dart:ui' as ui;

class TargetPage extends StatefulWidget {
  const TargetPage({Key? key}) : super(key: key);

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  Completer<GoogleMapController> mapController = Completer();

  TargetController controller = Get.put(getIt<TargetController>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initialize loadData method
    loadData();
  }
  //
  // List<String> images = [
  //   ImageLocations.path_green,
  //   ImageLocations.path_orange,
  //   ImageLocations.path_green,
  //   ImageLocations.path_orange,
  //   ImageLocations.path_green,
  //   ImageLocations.path_orange,
  // ];
  //
  // // created empty list of markers
  // final List<Marker> markers = <Marker>[];
  //
  // // created list of coordinates of various locations
  // final List<LatLng> latLen = <LatLng>[
  //   LatLng(19.0759837, 72.8776559),
  //   LatLng(28.679079, 77.069710),
  //   LatLng(26.850000, 80.949997),
  //   LatLng(24.879999, 74.629997),
  //   LatLng(16.166700, 74.833298),
  //   LatLng(12.971599, 77.594563),
  // ];
  //
  // // declared method to get Images
  // Future<Uint8List> getImages(String path, int width) async {
  //   ByteData data = await rootBundle.load(path);
  //   ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
  //       targetHeight: width);
  //   ui.FrameInfo fi = await codec.getNextFrame();
  //   return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
  //       .buffer
  //       .asUint8List();
  // }

  // created method for displaying custom markers according to index
  loadData() async {
    for (int i = 0; i < controller.images.length; i++) {
      final Uint8List markIcons =
          await controller.getImages(controller.images[i], 100);

      controller.markers.add(Marker(
        markerId: MarkerId(i.toString()),
        icon: BitmapDescriptor.fromBytes(markIcons),
        position: controller.latLen[i],
        infoWindow: InfoWindow(
          title: i.toString(),
        ),
      ));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.COLOR_BLUE_LIGHT5,
      appBar: TargetAppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Container(
                    child: GoogleMap(
                      myLocationEnabled: false,
                      mapType: MapType.normal,
                      myLocationButtonEnabled: false,
                      compassEnabled: false,
                      markers: Set<Marker>.of(controller.markers),
                      initialCameraPosition: CameraPosition(
                        target: LatLng(19.0759837, 72.8776559),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        mapController.complete(controller);
                      },
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 55.w,
                      child: Image.asset(
                        ImageLocations.target,
                        height: 49,
                        width: 49,
                      ))
                ],
              )),
          Expanded(
            flex: 3,
            child: Container(
              //
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 36.h,
              ),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.start,
                // physics: NeverScrollableScrollPhysics(),
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Text(
                    "Today's Target",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        color: AppColors.BLACK),
                  ),

                  SizedBox(
                    height: 10.h,
                  ),
                  // Icon(Ico)

                  //filters
                  Row(
                    children: [
                      Container(
                        height: 30,
                        child: Padding(
                            padding: EdgeInsets.only(left: 0, right: 8),
                            child: Center(
                              child: Image.asset(ImageLocations.filter,
                                  height: 20, width: 20),
                            )),
                      ),
                      MapDropDown(
                        title: "Distance",
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      MapDropDown(
                        title: "Business",
                      ),
                    ],
                  ),

                  ///map tile
                  SizedBox(
                    height: 10.h,
                  ),

                  ///items
                  ///
                  TargetItem(),
                  TargetItem(isIntracted: true),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<Position> getUserCurrentLocation() async {
  //   await Geolocator.requestPermission()
  //       .then((value) {})
  //       .onError((error, stackTrace) async {
  //     await Geolocator.requestPermission();
  //     print("ERROR" + error.toString());
  //   });
  //   return await Geolocator.getCurrentPosition();
  // }

  // void getCurrentLoacation() {
  //   getUserCurrentLocation().then((value) async {
  //     print(value.latitude.toString() + " " + value.longitude.toString());
  //
  //     // marker added for current users location
  //     controller.markers.add(Marker(
  //       markerId: MarkerId("3"),
  //       position: LatLng(value.latitude, value.longitude),
  //       infoWindow: const InfoWindow(
  //         title: 'My Current Location',
  //       ),
  //     ));
  //
  //     // specified current users location
  //     CameraPosition cameraPosition = new CameraPosition(
  //       target: LatLng(value.latitude, value.longitude),
  //       zoom: 14,
  //     );
  //
  //     final GoogleMapController controller = await mapController.future;
  //     controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  //   });
  // }
}
