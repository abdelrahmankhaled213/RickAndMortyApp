import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/material.dart';

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
    "Create Account",
    style: Styles.Montserratgrey16w300.copyWith
      (fontSize: 20,color: AppColor.offWhite),
  ),
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColor.main,
    shape: RoundedRectangleBorder(
      borderRadius:  BorderRadius.circular(4),
    ),
    fixedSize: Size(MediaQuery.of(context).size.width/1.5, 55),
    elevation: 10
  ),
);
  }
}
