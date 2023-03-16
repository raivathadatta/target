import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/app_colors.dart';
import '../../core/images_location.dart';

import '../widgets/buttons/retention_button.dart';
import '../widgets/container/date_header.dart';
import '../widgets/listitems/performance_item.dart';

class Retention extends StatelessWidget {
  const Retention({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          DateOverflowHeader(),
          PerformanceEngagementItem(
            title: "mATM churn winback",
          ),
          PerformanceEngagementItem(
            title: "SMB churn winback",
          ),
        ],
      ),
      floatingActionButton: RetentionButton(
        callBack: () {
          print("call back at retenon button");
        },
      ),
    );
  }
}
