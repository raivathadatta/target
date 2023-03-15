import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListActionsController extends GetxController {
  ///list
  RxList<File> images = <File>[].obs;

  ///textediting controller s
  TextEditingController textEditingController1 = TextEditingController();
  TextEditingController textEditingController2 = TextEditingController();
  TextEditingController textEditingController3 = TextEditingController();

  ///rx varibles
  RxString comment1 = "".obs;
  RxString comment2 = "".obs;
  RxString comment3 = "".obs;
}
