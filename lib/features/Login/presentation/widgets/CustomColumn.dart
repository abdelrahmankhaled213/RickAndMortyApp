import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomColumn extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome",style: Styles.Montserratblack24w700.copyWith(fontSize: 36.sp),),
        Text("Back !",style: Styles.Montserratblack24w700.copyWith(fontSize: 36.sp),),
      ],
    );
  }
}
