import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
final Color color;
final double height;
final double width;
final double radius;
final String text;
CustomContainer({
  required this.width,
  required this.height,
  required this.color,
  required this.radius,
  required this.text
});
  @override
  Widget build(BuildContext context) {
    return   Container(
      height:height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),

      ),
      child: Center(
        child: Text(text,style: Styles.Poppins14regular.copyWith(
          color: AppColor.offWhite
        ),),
      ),

    );
  }
}

