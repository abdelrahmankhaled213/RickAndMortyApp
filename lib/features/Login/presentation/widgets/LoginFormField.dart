import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit_state.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/Face0rGoogle.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/widgets/CustomText.rich.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
class LoignFormField extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    var tomakeiteasy= BlocProvider.of<LoginCubit>(context);
    return BlocConsumer<LoginCubit,LoginState>(
      listener: (context, state) {
if(state is LoadedLogin){
  GoRouter.of(context).pushReplacement("/HomeScreenView");
}
if(state is FaliureLogin){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login failed")));
}
if(state is LoadingLogin){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login loading")));
}
      },
      builder: (context, state) {
        return  Form(
          key: tomakeiteasy.loginkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextFormField(onchange: (value){
                tomakeiteasy.email=value;
              }, text: "email", prefixIcon: Icons.person),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 21,
              ),
              CustomTextFormField(onchange: (value){
          tomakeiteasy.password=value;
              },
                text: "password",
                obstext: tomakeiteasy.convert,
                prefixIcon: Icons.lock,
                iconButton: IconButton(
                    icon: Icon(tomakeiteasy.convert?Icons.visibility_off:Icons.visibility),
                    onPressed:() {
                      tomakeiteasy.changeIconState();
                    }
                ),
              ),
              SizedBox(
                height: 5.h
              ),
              Align(alignment: Alignment.centerRight,child: GestureDetector(
                onTap: (){
goPush("/ForgotPasswordView", context);
                },
                child: Text("Forgot password ?",style:Styles.Montserratgrey16w300.copyWith(
                    fontSize: 12.sp,
                    color: AppColor.main
                ),),
              )),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 18,
              ),
                 state is LoadingLogin? const Center(
           child: const CircularProgressIndicator(
             color: AppColor.main,

           ),
                 ):
                 CustomButtonCore(text: "Create account", touch: (){
          if(tomakeiteasy.loginkey.currentState!.validate()){
            tomakeiteasy.loginWithEmailAndPassword();
          }
                 }),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 18,
              ),
              FaceOrGoogle(),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 18,
              ),
          CustomTextRich(
            ontap: (){
              GoRouter.of(context).push("/SignUpView");
            },
            text: "don\'t have an account ? ",
            textstyle1: Styles.Montserratgrey16w300.copyWith(
              fontSize: 14.sp
            ), textstyle2: Styles.Montserratgrey16w300.copyWith(
            fontSize: 14.sp,
            color: AppColor.main,
            decoration: TextDecoration.underline,
            decorationColor: AppColor.main
          ),
            text2: "Sign Up",
          ),

            ],
          ),
        );
      },
    );
  }
}
