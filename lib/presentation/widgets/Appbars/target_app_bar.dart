import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../performence/notification_alerts_screen.dart';

AppBar TargetAppBar() => AppBar(
      shadowColor: AppColors.SHADOW,
      backgroundColor: AppColors.WHITE,
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: AppColors.black,
          )),
      title: Text(
        "Today's Targets",
        style: TextStyle(
            color: AppColors.BLACK, fontSize: 16, fontWeight: FontWeight.w600),
      ),
      actions: [
        GestureDetector(
          onTap: () => Get.to(NotificationsAndAllerts()),
          child: Container(
            margin: EdgeInsets.only(top: 6, left: 0, right: 10, bottom: 10),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
            child: Stack(
              children: [
                Icon(
                  Icons.notifications_none,
                  color: Colors.black,
                  size: 20,
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "1",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 8),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
