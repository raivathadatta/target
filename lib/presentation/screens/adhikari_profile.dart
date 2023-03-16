import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spice_tracker/controller/adhikari_profile_controller.dart';
import 'package:spice_tracker/data/dependency_injection/inject.dart';

import '../../core/app_colors.dart';
import '../../core/images_location.dart';
import '../widgets/Appbars/userappbar.dart';
import '../widgets/container/coloverGtv.dart';
import '../widgets/container/headersubvaluecontainer.dart';
import '../widgets/container/labelwithbulb.dart';
import '../widgets/switches/mswitch.dart';

class AdhikariProfile extends StatefulWidget {
  const AdhikariProfile({Key? key}) : super(key: key);

  @override
  State<AdhikariProfile> createState() => _AdhikariProfileState();
}

class _AdhikariProfileState extends State<AdhikariProfile> {
  AdhikariProfileController controller =
      Get.put(getIt<AdhikariProfileController>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar(
          title: "Sanjeev Sharma",
          id: "Adhikaris ID: 11485",
          showQr: false,
          onQrClick: () {},
          onusertap: () {}),
      body: Padding(
        padding: EdgeInsets.only(left: 16.w, right: 16),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 25.h,
              ),
              Text(
                "Noida,UP",
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Divider(
                thickness: 2.h,
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Mapped Distributor",
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 14.sp),
                  ),
                  Spacer(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sanjeev Sharma",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.sp),
                      ),
                      Text(
                        "Distributor ID: 11485",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 10.sp),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "CMS service",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 14.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                        "Interested in using Spice Money CMS service?",
                        style: TextStyle(
                            color: AppColors.GREY_SUBTITLE,
                            fontWeight: FontWeight.w200,
                            fontSize: 12.sp),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                    ],
                  ),
                  Spacer(),
                  Obx(
                    () => Mswitch(
                      onSwitchChange: (s) => controller.toggleSwitch(s),
                      switchvalue: controller.isSwitched.value,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Divider(
                    thickness: 2,
                  ),
                ],
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  Expanded(
                      child: HeaderSubValueContainer(
                          title: "40",
                          subvalue: "Month till date \n -GTV",
                          type: "")),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(right: 28.0.w),
                        child: Image.asset(
                          ImageLocations.vs,
                          height: 20.h,
                          width: 20.h,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: HeaderSubValueContainer(
                          title: "56L",
                          subvalue: "Last month till date - GTV",
                          type: "")),
                  Expanded(
                      child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      true
                          ? Container(
                              height: 34.h,
                              width: 70.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.arrow_upward,
                                    color: AppColors.GLOW_GREEN,
                                    size: 12,
                                  ),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Text("20%",
                                      style: TextStyle(
                                          color: AppColors.GLOW_GREEN)),
                                ],
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.GREEN_WHITE,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )
                          : Container(),
                      // : Container(
                      //     height: 34.h,
                      //     width: 70.h,
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         Icon(
                      //           Icons.arrow_downward,
                      //           color: AppColors.RED,
                      //           size: 12,
                      //         ),
                      //         SizedBox(
                      //           width: 1,
                      //         ),
                      //         Text(
                      //           "${info.percentage.value}%",
                      //           style: TextStyle(
                      //               color: AppColors.RED, fontSize: 14.sp),
                      //         ),
                      //       ],
                      //     ),
                      //     decoration: BoxDecoration(
                      //       color: AppColors.GLOW_RED,
                      //       borderRadius: BorderRadius.circular(20),
                      //     ),
                      //   ),
                    ],
                  ))
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                children: [
                  Text(
                    "Life time max GTV",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Text(
                    "40.5L",
                    style:
                        TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Divider(
                thickness: 2,
              ),
              SizedBox(
                height: 5.h,
              ),
              GestureDetector(
                onTap: () => {},
                child: AbsorbPointer(
                  absorbing: true,
                  child: Row(
                    children: [
                      Text(
                        "Ranking product GTV bar \t",
                        style: TextStyle(
                            fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          right: 8,
                        ),
                        child: Icon(
                          Icons.info_outline,
                          size: 18.sp,
                          color: AppColors.COLOR_BLUE_LIGHT2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0),
                child: Row(
                  // padding: EdgeInsets.symmetric(vertical: 5),

                  children: [
                    ColorGtvListItem(
                      color: AppColors.GREEN_TASK,
                      text: "AePS",
                      enableStar: false,
                    ),
                    ColorGtvListItem(
                      color: AppColors.Yellow,
                      text: "mATM",
                      enableStar: false,
                    ),
                    ColorGtvListItem(
                      color: AppColors.GREEN_TASK,
                      text: "DMT",
                      enableStar: false,
                    ),
                    ColorGtvListItem(
                      color: AppColors.RED,
                      text: "CMS",
                      enableStar: false,
                    ),
                    ColorGtvListItem(
                      color: AppColors.RED,
                      text: "Travel",
                      enableStar: false,
                    ),
                    ColorGtvListItem(
                      color: AppColors.RED,
                      text: "BBPS",
                      enableStar: false,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    ImageLocations.insights,
                    height: 18.h,
                    width: 18.h,
                  ),
                  SizedBox(
                    width: 10.h,
                  ),
                  Text(
                    "Important Insights",
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.BLACK_HEADING),
                  )
                ],
              ),
              SizedBox(
                height: 18.h,
              ),
              Row(
                children: [
                  for (int i = 0; i < 5; i++)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "$i",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            "sub",
                            style: TextStyle(
                              color: AppColors.BLACK_LIGHT_FONT,
                              fontSize: 11.sp,
                            ),
                          )
                        ],
                      ),
                    ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              LabelWithBulb(
                heading: "Recommendation",
                isChurned: false,
                label: "Branch not working on AEPS or MATM",
              ),
            ]),
      ),
    );
  }
}
