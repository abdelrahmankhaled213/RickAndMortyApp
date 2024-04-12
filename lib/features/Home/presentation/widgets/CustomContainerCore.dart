import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomContainerCore extends StatelessWidget {
String image;
void Function() tap;

CustomContainerCore({
  required this.image,
  required this.tap,

});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:tap,
      child: Container(
        height: 100.h,
        width: 100.w,
decoration: BoxDecoration(
  borderRadius: BorderRadius.circular(25.r),
  border: Border.all(
    color: AppColor.customPurple
  )
),
        child: FadeInImage(
          image: NetworkImage(
            image,
          ),
          placeholder: const AssetImage(
            "assets/Images/Animation - 1711669824617.gif",
          ),
        ),
      ),
    );
  }
}
