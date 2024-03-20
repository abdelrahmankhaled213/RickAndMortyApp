import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/CustomTextForgotPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
        padding:  EdgeInsets.symmetric(
        horizontal: 20.w
    ),
      child:


      CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child:
CustomTextForgotPassword(),
          ),
          SliverToBoxAdapter(child:
      SizedBox(height: 15.h,),
          ),
              SliverToBoxAdapter(child:
              CustomTextFormField(
                text: "Enter your Email Address",
                prefixIcon: Icons.email,
                onchange: (text) {

              },)
              )

        ],
      ),
    )
    )
    );
  }
}
