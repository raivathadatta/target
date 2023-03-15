import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';

AppBar CommonAppBar(
    {required String title,
    Color? color,
    Color? textcolor,
    VoidCallback? onBack}) {
  return AppBar(
    shadowColor: AppColors.SHADOW,
    backgroundColor: color ?? AppColors.WHITE,
    leading: InkWell(
        onTap: () {
          Get.back();
          onBack?.call();
        },
        child: Icon(
          Icons.arrow_back_outlined,
          color: textcolor ?? AppColors.black,
        )),
    title: Text(
      title,
      style: TextStyle(color: textcolor ?? AppColors.black),
    ),
  );
}
