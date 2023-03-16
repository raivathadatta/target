import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;

import 'package:injectable/injectable.dart';

import 'package:spice_tracker/core/app_colors.dart';
import 'package:spice_tracker/core/images_location.dart';

@injectable
class TargetController extends GetxController {
  Uint8List? marketimages;

  List<String> images = [
    ImageLocations.path_green,
    ImageLocations.path_orange,
    ImageLocations.path_green,
    ImageLocations.path_orange,
    ImageLocations.path_green,
    ImageLocations.path_orange,
  ];

  final List<Marker> markers = <Marker>[];

  final List<LatLng> latLen = <LatLng>[
    LatLng(19.0759837, 72.8776559),
    LatLng(28.679079, 77.069710),
    LatLng(26.850000, 80.949997),
    LatLng(24.879999, 74.629997),
    LatLng(16.166700, 74.833298),
    LatLng(12.971599, 77.594563),
  ];

  Future<Uint8List> getImages(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
