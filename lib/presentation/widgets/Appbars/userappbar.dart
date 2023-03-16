import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spice_tracker/core/images_location.dart';
import 'package:spice_tracker/core/app_colors.dart';

PreferredSize UserAppBar(
    {required String title,
    required String id,
    Function()? onusertap,
    String? label,
    Color? textcolor,
    Color? backgroundcolor,
    bool showQr = false,
    Function? onQrClick,
    String tagtext = ""}) {
  return PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: backgroundcolor ?? AppColors.main_blue,
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: textcolor ?? AppColors.WHITE,
            )),
        title: Row(
          children: [
            /*--------------3 items photo text and id -------------- */
            InkWell(
              onTap: onusertap!,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageLocations.house,
                    height: 30,
                    width: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(Get.context!).size.width * 0.3,
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: textcolor ?? AppColors.WHITE),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          if (tagtext.isNotEmpty)
                            Container(
                              constraints: BoxConstraints(maxWidth: 120),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: AppColors.main_blue,
                              ),
                              child: Text(
                                tagtext,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                        ],
                      ),
                      Text(
                        label == null ? "Adhikaris ID: $id" : "$label ID: $id",
                        style: TextStyle(
                            color: textcolor ?? AppColors.WHITE,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                ],
              ),
            ),
            /*--------------3 items photo text and id ------------ */
            Spacer(),
            if (showQr)
              GestureDetector(
                onTap: () => onQrClick!(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.sp),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.qr_code,
                        size: 14.sp,
                      ),
                      Text(
                        "\tQr Scan",
                        style: TextStyle(fontSize: 14.sp),
                      )
                    ],
                  ),
                  height: kToolbarHeight - 27.h,
                  decoration: BoxDecoration(
                      border: Border.all(color: AppColors.WHITE),
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.only(left: 5, right: 5),
              height: 26,
              width: 26,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
              child: Image.asset(
                ImageLocations.call,
              ),
            ),

            // Row(
            //   children: [
            //     Icon(
            //       Icons.call,
            //       color: textcolor ?? AppColors.kWhite,
            //       size: 24,
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //   ],
            // )
          ],
        ),
      ));
}
