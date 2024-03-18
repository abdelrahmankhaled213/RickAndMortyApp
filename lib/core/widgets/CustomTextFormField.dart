import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
String text;
IconData prefixIcon;
void Function(String text)onchange;
IconButton? iconButton;
bool? obstext;
CustomTextFormField({
  required this.onchange,
  required this.text,
  required this.prefixIcon,
   this.iconButton,
  this.obstext

});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: MediaQuery.of(context).size.width/1.5,

      child: TextFormField(
        obscureText: obstext??false,
        validator: (value) {
          if(value!.isEmpty){
           return "the textfield is empty" ;
          }
return null;
        },
      onChanged: onchange,
        cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: text,
        suffixIcon: iconButton,
        prefixIcon:  Icon(prefixIcon,color: AppColor.icondarkgrey,),
        filled: true,
        fillColor:  Colors.grey[300],
        border: OutlineInputBorder(
      borderRadius:  BorderRadius.circular(10.r),
          borderSide: const BorderSide(
            color: Colors.black
          ),

        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.offWhite
          )
        ),
        hintStyle: Styles.Montserratblack24w700.copyWith(
          color: Colors.black,
          fontSize: 12
        )
      ),
      ),
    );
  }
}
