import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/core/widgets/custombutton.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Functions/signupfun.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class CreateAnAccountForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,AuthState>(

      builder: (context, state) {
          return Form(
            key: BlocProvider.of<SignUpCubit>(context).signupkey,
            child: Column(
              children: [
                CustomTextFormField(
            onchange: (text) {
              BlocProvider.of<SignUpCubit>(context).email=text;
            },
                  text: "Username",
                  prefixIcon: Icons.person,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                CustomTextFormField(
                  obstext: BlocProvider.of<SignUpCubit>(context).changeiconstatepassword,
                  iconButton: IconButton(
                    icon: Icon(BlocProvider.of<SignUpCubit>(context).changeiconstatepassword?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      BlocProvider.of<SignUpCubit>(context).changeIconState();
                    },
                  ),
                  onchange: (text) {
                    BlocProvider.of<SignUpCubit>(context).password=text;
                  },
                  text: "Password",
                  prefixIcon: Icons.lock,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                CustomTextFormField(
                  obstext: BlocProvider.of<SignUpCubit>(context).changeiconstateconfirmpassword,
                  iconButton: IconButton(
                    icon: Icon(BlocProvider.of<SignUpCubit>(context).changeiconstateconfirmpassword?Icons.visibility_off:Icons.visibility),
                    onPressed: (){
                      BlocProvider.of<SignUpCubit>(context).changeIconStateConfirmPassword();
                    },
                  ),
                 onchange: (text) {
                   BlocProvider.of<SignUpCubit>(context).confirmpassword=text;
                 },
                  text: " Confirm Password",
                  prefixIcon: Icons.lock,
                ),
                SizedBox(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 21,
                ),
                state is LoadingState?
                const Center(
              child: CircularProgressIndicator(
                 color: AppColor.main,

               ),
            ): CustomButtonCore(
                  text: "Create Account",
                  touch: () {
                    // checkPasswordEqualConfirmPassword(context);
                    if(
                    BlocProvider.of<SignUpCubit>(context).password!=
    BlocProvider.of<SignUpCubit>(context).confirmpassword) {
                      ScaffoldMessenger.of(context).showSnackBar(
                           SnackBar(
                              backgroundColor: AppColor.main,
                              content: Text(" Password is wrong"
                                , style: Styles.Montserratgrey16w300,
                              )
                          )
                      );
                      return;
                    }
                    checkValidation(context);

                  },
                )
              ],
            ),
          );
      }
        ,listener: (context, state) {
      checkLoadedState(state, context);
      checkFaliureState(state, context);
    },
    );
  }
}
