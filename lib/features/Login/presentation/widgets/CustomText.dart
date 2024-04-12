import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return CustomTextRich(text: "* ", textstyle1: Styles.Montserratgrey16w300.copyWith(
      color: AppColor.orange
    ), textstyle2:Styles.Montserratgrey16w300.copyWith(
    ), text2: "We will send you a message to set or reset your new password", ontap: (){});
  }
}
