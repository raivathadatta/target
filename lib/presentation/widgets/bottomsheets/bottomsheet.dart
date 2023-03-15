import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:spice_tracker/utils/app_colors.dart';

class BottomSheets {
  static ReminderBottomSheet({
    required BuildContext context,
    required TextEditingController dateController,
    required TextEditingController timeController,
    required Function() dateCallBack,
    required Function() timeCallBAck,
  }) =>
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.35,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Reminder",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 22,
                          ))
                    ],
                  ),
                  //add a date picker
                  Center(
                      child: TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        suffixIcon:
                            Icon(Icons.calendar_today, color: Colors.black),
                        labelText: "Select Date"),
                    readOnly: true,
                    onTap: dateCallBack,
                  )),

                  //add a time picker
                  Center(
                      child: TextField(
                    controller: timeController,
                    decoration: InputDecoration(
                        suffixIcon: Icon(
                          Icons.schedule_outlined,
                          color: Colors.black,
                        ),
                        labelText: "pick time"),
                    readOnly: true,
                    onTap: timeCallBAck,
                  )),
                  SizedBox(
                    height: 10,
                  ),

                  //add a submit button
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.main_blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 20, horizontal: 140),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          });

  static CommentBottomSheet({
    required BuildContext context,
    required TextEditingController commentController,
    // required TextEditingController timeController,
    required Function(String) callBack,
    // required Function() timeCallBAck,
  }) =>
      showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          backgroundColor: Colors.white,
          builder: (mcontext) {
            return StatefulBuilder(builder: (context, setState) {
              return ListView(
                controller: ScrollController(),
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 20, right: 10),
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Comment",
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(mcontext);
                          },
                          icon: Icon(
                            Icons.clear,
                            size: 22,
                          ))
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      TextField(
                        maxLines: 4,
                        controller: commentController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: AppColors.white1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.grey2, width: 0.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors.grey2, width: 0.0),
                            ),
                            hintText: "Comment",
                            hintStyle:
                                TextStyle(color: AppColors.grey_comment)),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      callBack(commentController.text);
                      Get.back();
                    },
                    child: Container(
                      color: AppColors.main_blue,
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 100),
                      child: Center(
                        child: Text(
                          "Subbmit",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              );
            });
          });
}
