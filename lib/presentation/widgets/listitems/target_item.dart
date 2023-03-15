import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/images_loation.dart';
import '../buttons/direction_button.dart';
import '../container/target_droup_down.dart';

class TargetItem extends StatelessWidget {
  final bool isIntracted;
  const TargetItem({Key? key, this.isIntracted = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Card(
        elevation: 1,
// color: ,
        child: Container(
          color: isIntracted ? AppColors.COLOR_BLUE_LIGHT5 : AppColors.WHITE,
          padding:
              EdgeInsets.only(right: 16.w, left: 10.w, bottom: 10.h, top: 10.h),
          child: Column(
            children: [
              ///1st line
              Row(
                children: [
                  Image.asset(
                    ImageLocations.house,
                    height: 36.h,
                    width: 36.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nirav Sharma",
                        style: TextStyle(
                          color: AppColors.BLACK,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Distributor ID: 11485",
                        style: TextStyle(
                          color: AppColors.BLACK,
                          fontSize: 12.sp,
// fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: AppColors.BLACK,
                        size: 15.sp,
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      Text(
                        "6.4 KM",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.BLACK,
                          fontSize: 14.sp,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              ///2st line
              Row(
                children: [
                  SizedBox(
                    width: 44.w,
                  ),
                  Text(
                    "St Stephen's College, Sudhir Bose Marg, | 33 min away \nUniversity Enclave, Delhi, 110007",
                    style: TextStyle(
                      color: AppColors.White_Gray2,
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),

              ///3st line
              isIntracted
                  ? Row(
                      children: [
                        SizedBox(
                          width: 10.w,
                        ),
                        Icon(
                          Icons.check,
                          size: 15.sp,
                          color: AppColors.GREEN_TASK,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        Text(
                          "Interacted with adhikari",
                          style: TextStyle(
                              color: AppColors.DARGRAY, fontSize: 12.sp),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        const MapDropDown(
                          title: "View Details",
                          titleColor: AppColors.BLUE_PRIMARY,
                          showIcon: false,
                        ),
                        const Spacer(),
                        Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.DARGRAY)),
                            child: Icon(
                              Icons.call,
                              color: AppColors.BLUE_PRIMARY,
                              size: 10.sp,
                            ))
                      ],
                    )
                  : Row(
                      children: [
                        SizedBox(
                          width: 0.w,
                        ),
                        const Direction(
                          title: 'Direction',
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        const MapDropDown(
                          title: "View Details",
                          titleColor: AppColors.BLUE_PRIMARY,
                          showIcon: false,
                        ),
                        const Spacer(),
                        Container(
                            padding: EdgeInsets.all(5.sp),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.DARGRAY)),
                            child: Icon(
                              Icons.call,
                              color: AppColors.BLUE_PRIMARY,
                              size: 10.sp,
                            ))
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
