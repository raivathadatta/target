import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spice_tracker/data/dependency_injection/inject.dart';
import 'package:spice_tracker/utils/app_colors.dart';

import '../../controller/list_actions_controller.dart';
import '../../utils/images_loation.dart';

import '../widgets/grid/gridimage.dart';
import '../widgets/listitems/list_actions_list_item.dart';

class ListOfActivities extends StatefulWidget {
  const ListOfActivities({Key? key}) : super(key: key);

  @override
  State<ListOfActivities> createState() => _ListOfActivitiesState();
}

class _ListOfActivitiesState extends State<ListOfActivities> {
  ListActionsController controller = Get.put(getIt<ListActionsController>());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.main_blue,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: Row(
          children: [
            Container(
              padding: EdgeInsets.all(5),
              height: 40.h,
              width: 40.w,
              child: Image.asset(
                ImageLocations.house,
              ),
            ),
            Column(
              children: [
                Text(
                  "Nirav Sharma",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 16.sp),
                ),
                Text(
                  " Adhikaris ID: 11485",
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            padding: EdgeInsets.all(11),
            margin: EdgeInsets.only(
              left: 5,
            ),
            height: 26,
            width: 26,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white)),
            child: Image.asset(
              ImageLocations.info,
              fit: BoxFit.scaleDown,
            ),
          ),
          SizedBox(
            width: 5.w,
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
          SizedBox(
            width: 5.w,
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 12.0.w, right: 12.w, top: 12.h),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: ListView(
              children: [
                SizedBox(
                  height: 25.h,
                ),
                Text(
                  "List of activities",
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Obx(() => ListOfActionsListItem(
                      showTickIcon: controller.comment1 != "",
                      callBack: (String value) {
                        controller.comment1.value = value;
                      },
                      controller: controller.textEditingController1,
                      tittle: "Why doesn’t he use Spice Preferred Plans",
                      showMessage: controller.comment1.value == "",
                      comment: controller.comment1.value,
                    )),
                Obx(
                  () => ListOfActionsListItem(
                    showTickIcon: controller.comment2 != "",
                    callBack: (String value) {
                      controller.comment2.value = value;
                    },
                    controller: controller.textEditingController2,
                    tittle: "Why doesn’t he use Voice feature",
                    showMessage: controller.comment2.value == "",
                    comment: controller.comment2.value,
                  ),
                ),
                Obx(() => ListOfActionsListItem(
                      showTickIcon: controller.comment3 != "",
                      callBack: (String value) {
                        controller.comment3.value = value;
                      },
                      controller: controller.textEditingController3,
                      tittle: "Why doesn’t he use mATM service",
                      showMessage: controller.comment3.value == "",
                      comment: controller.comment3.value,
                    )),
                SizedBox(
                  height: 40.h,
                ),
                Text(
                  "Add Remarks",
                  style:
                      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                      maxLines: 3,
                      controller: TextEditingController(),
                      decoration: const InputDecoration(
                          filled: true,
                          fillColor: AppColors.white1,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.grey2, width: 0.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.grey2, width: 0.0),
                          ),
                          hintText: "Comment",
                          hintStyle: TextStyle(color: AppColors.grey_comment)),
                    ),
                  ]),
                ),
                GridImage(
                    images: controller.images,
                    placeholderImage: ImageLocations.camera_rounded,
                    context: context,
                    title: "",
                    compressImage: true,
                    onchange: (files) {
                      controller.images.clear();
                      controller.images.addAll(files);
                    }),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.main_blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 166.w),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
