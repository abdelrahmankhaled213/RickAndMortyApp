import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/CreateAccountForm.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/Face0rGoogle.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/create_an_account.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class SignUpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(
            horizontal: 10.w
          ),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child:  SizedBox(
                height: 20.h,
                ),
              ),
              SliverToBoxAdapter(
                child: CreateAnAccount(),
              ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.of(context).size.height/15,
          ),
        ),
          SliverToBoxAdapter(
            child: CreateAnAccountForm(),
          ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/26 ,
                ),
              ),
          SliverToBoxAdapter(
            child: FaceOrGoogle(),
          ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height/28 ,
                ),
              ),
              SliverToBoxAdapter(
                child:  Align(
                  alignment: Alignment.center,
                  child: CustomTextRich(
                    ontap: (){
                      GoRouter.of(context).push("/LoginView");
                    },
                      text: "I Already Have an Account \t",
                      textstyle1: Styles.Poppins14regular,
                      textstyle2:Styles.Montserratgrey16w300.copyWith(
                    fontSize: 14.sp,
                    color: AppColor.main,
                                     decoration: TextDecoration.underline,
                    decorationColor: AppColor.main

                  ) , text2: "Login"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

