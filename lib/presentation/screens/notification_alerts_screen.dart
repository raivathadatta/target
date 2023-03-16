import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:spice_tracker/presentation/widgets/tabbar/m_tab_bar.dart';
import '../../core/app_colors.dart';
import '../../core/images_location.dart';
import 'alertstab.dart';
import 'notification_tab.dart';

class NotificationsAndAllerts extends StatefulWidget {
  const NotificationsAndAllerts({Key? key}) : super(key: key);

  @override
  State<NotificationsAndAllerts> createState() =>
      _NotificationsAndAllertsState();
}

class _NotificationsAndAllertsState extends State<NotificationsAndAllerts>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final TABS = [
    const Tab(
      text: "Alerts",
    ),
    const Tab(text: "Interaction"),
  ];
  @override
  void initState() {
    super.initState();
    tabController = new TabController(initialIndex: 0, length: 2, vsync: this);
    //  controller.tabController.addListener(controller.changeTab);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: AppColors.SHADOW,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: AppColors.black,
            )),
        title: Container(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Notifications",
            style: TextStyle(color: AppColors.black),
          ),
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Container(
                color: Colors.white, child: MTabBar(tabController, TABS))),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          AlertsTab(),
          NotificationTab(),
        ],
        // children: [AlertsTab(), IntractionTab()],
      ),
    );
  }
}
