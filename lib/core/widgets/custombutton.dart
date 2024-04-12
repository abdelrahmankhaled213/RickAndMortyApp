import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonCore extends StatelessWidget {

void Function() touch;
String text;
CustomButtonCore({
  required this.text,
  required this.touch
});
  @override
  Widget build(BuildContext context) {
    return
ElevatedButton(
  onPressed: touch,
  child: Text(
    text,
    style: Styles.Montserratgrey16w300.copyWith
      (
        fontSize: 20.sp,color: AppColor.offWhite,fontWeight: FontWeight.w500),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.main,
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(4),
    ),
    fixedSize: Size(317.w, 50.h),
    elevation: 10
  ),
);
  }
}
