import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextForgotPassword extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 130.h,width: 203.w,child: Text("Forgot Password ?",style: Styles.Montserratblack24w700.copyWith(
      fontSize: 36.sp
    ),
    )
    );
  }
}
