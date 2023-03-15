import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/utils/app_colors.dart';

import '../../utils/images_loation.dart';
import '../widgets/listitems/alert_list_item.dart';

class AlertsTab extends StatelessWidget {
  const AlertsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 15.sp,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: false,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Today",
                  style: TextStyle(
                    color: AppColors.DARGRAY,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AlertListItem(imageLocation: ImageLocations.navigation),
                AlertListItem(imageLocation: ImageLocations.navigation),
                AlertListItem(imageLocation: ImageLocations.navigation),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Yesterday",
                  style: TextStyle(
                    color: AppColors.DARGRAY,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                AlertListItem(imageLocation: ImageLocations.house),
                AlertListItem(imageLocation: ImageLocations.house),
                AlertListItem(imageLocation: ImageLocations.house),
                AlertListItem(imageLocation: ImageLocations.house),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
