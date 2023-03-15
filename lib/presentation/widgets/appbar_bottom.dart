import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/app_colors.dart';

class MTabBar extends StatelessWidget implements PreferredSizeWidget {
  final TabController? tabController;
  final List<Widget> tabs;
  final bool isScrollable;
  const MTabBar(
    this.tabController,
    this.tabs, {
    Key? key,
    this.isScrollable = true,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(30.h);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: TabBar(
          unselectedLabelColor: AppColors.UNSELECTED_TAB_COLOR,
          controller: tabController,
          indicatorColor: AppColors.CYAN_BLUE,
          labelColor: AppColors.CYAN_BLUE,
          indicatorSize: TabBarIndicatorSize.label,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(
              width: 3.0,
              color: AppColors.CYAN_BLUE,
            ),
            insets: EdgeInsets.symmetric(horizontal: 2.0),
          ),
          labelStyle: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 16.0),
          isScrollable: this.isScrollable,
          tabs: tabs,
        ),
      ),
    );
  }
}
