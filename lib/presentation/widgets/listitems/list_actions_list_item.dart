import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/images_loation.dart';
import '../bottomsheets/bottomsheet.dart';

class ListOfActionsListItem extends StatelessWidget {
  final String tittle;
  final Function(String) callBack;
  final TextEditingController controller;
  final bool showTickIcon;
  final bool showMessage;
  final String comment;
  const ListOfActionsListItem(
      {Key? key,
      required this.tittle,
      required this.controller,
      required this.callBack,
      required this.showTickIcon,
      required this.showMessage,
      required this.comment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: AppColors.List_shadow,
          ),
        ),
        elevation: 1,
        shadowColor: AppColors.List_shadow,
        child: Padding(
          padding:
              EdgeInsets.only(top: 16.h, bottom: 16.h, right: 18.w, left: 18.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 5.h,
              ),
              showTickIcon
                  ? Image.asset(
                      ImageLocations.check_circle,
                      height: 28.h,
                      width: 28.w,
                    )
                  : Container(
                      height: 28.h,
                      width: 28.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.List_shadow,
                        ),
                      ),
                    ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tittle,
                    style: TextStyle(
                        // color: ,
                        // fontWeight:FontWeight.w ,
                        fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  GestureDetector(
                      onTap: () => BottomSheets.CommentBottomSheet(
                            callBack: (String value) => callBack(value),
                            commentController: controller,
                            context: context,
                          ),
                      child: Container(
                        child: showMessage
                            ? Row(
                                children: [
                                  Icon(Icons.message,
                                      size: 12.sp, color: Color(0xff2C3891)),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "Add Comment",
                                    style: TextStyle(
                                        // color: ,
                                        // fontWeight:FontWeight.w ,
                                        fontSize: 11.sp,
                                        color: Color(0xff2C3891)),
                                  ),
                                ],
                              )
                            : Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 5.w, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: AppColors.listColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    Icon(Icons.message,
                                        size: 12.sp, color: Color(0xff2C3891)),
                                    SizedBox(
                                      width: 4.w,
                                    ),
                                    Text(
                                      comment,
                                      style: TextStyle(
                                          // color: ,
                                          // fontWeight:FontWeight.w ,
                                          fontSize: 11.sp,
                                          color: Color(0xff2C3891)),
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Icon(Icons.edit,
                                        size: 12.sp, color: Color(0xff2C3891)),
                                  ],
                                ),
                              ),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
