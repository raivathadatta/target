import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spice_tracker/presentation/performence/alertstab.dart';

class AlertListItem extends StatelessWidget {
  final String imageLocation;
  const AlertListItem({Key? key, required this.imageLocation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    // padding: const EdgeInsets.all(5),
                    height: 56.h,
                    width: 46.w,
                    child: Image.asset(
                      imageLocation,
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "5 SMA near you",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          // Spacer(),
                          SizedBox(
                            width: 126.w,
                          ),
                          Text(
                            "15 mins ago",
                            style: TextStyle(
                              // color: Color(0xFF005C),
                              fontSize: 13.sp,
                              // fontWeight: FontWeight.w800,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Text(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                            // fontWeight: FontWeight.w800,
                          ),
                          "There are 5 SMA near your location. Click here to know \n their details.")
                    ],
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
