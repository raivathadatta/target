import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:spice_tracker/data/dependency_injection/inject.dart';
import 'package:spice_tracker/presentation/screens/retention.dart';

import '../../controller/performence_controller.dart';

import '../../core/app_colors.dart';
import '../../core/images_location.dart';
import '../widgets/tabbar/m_tab_bar.dart';
import 'notification_alerts_screen.dart';

class Performance extends StatefulWidget {
  const Performance({Key? key}) : super(key: key);

  @override
  _PerformanceState createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance>
    with SingleTickerProviderStateMixin {
  final controller = Get.put(getIt<PerformanceController>());

  @override
  void initState() {
    super.initState();
    controller.tabController =
        TabController(initialIndex: 1, length: 5, vsync: this);

    //  controller.tabController.addListener(controller.changeTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.WHITE,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(110.h),
        child: AppBar(
          leading: Container(
            margin: EdgeInsets.only(top: 8),
            child: Image.asset(
              ImageLocations.logosma,
              height: 36,
              width: 36,
            ),
          ),
          // title: ,
          actions: [
            Container(
              margin: EdgeInsets.only(top: 12, left: 5, right: 10, bottom: 10),
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
              decoration: BoxDecoration(
                color: AppColors.main_blue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "Field Mode",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
            Icon(
              Icons.search,
              size: 25,
              color: AppColors.black,
            ),
            // Icon(Icon),
            GestureDetector(
              onTap: () => Get.to(NotificationsAndAllerts()),
              child: Container(
                margin: EdgeInsets.only(top: 6, left: 5, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                child: Stack(
                  children: [
                    Icon(
                      Icons.notifications,
                      color: Colors.black,
                      size: 25,
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
            Icon(
              Icons.more_vert,
              color: AppColors.black,
            )
          ],

          shadowColor: AppColors.SHADOW,
          backgroundColor: AppColors.WHITE,
          bottom: MTabBar(controller.tabController, [
            Tab(
              text: "Engagement",
            ),
            Tab(
              text: "Retention",
            ),
            Tab(
              text: "Activity",
            ),
            Tab(
              text: "GTV View",
            ),
            Tab(
              text: "Product Summary",
            ),
          ]),
        ),
      ),
      body: TabBarView(
        controller: controller.tabController,
        //    physics: NeverScrollableScrollPhysics(),
        children: [
          Container(),
          Retention(),
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
