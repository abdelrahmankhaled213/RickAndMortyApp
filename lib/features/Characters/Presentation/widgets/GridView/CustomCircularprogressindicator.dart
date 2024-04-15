import 'package:flutter/material.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(
        backgroundColor: AppColor.yellow,
        color: AppColor.mywhite,
      ),
    );
  }
}
