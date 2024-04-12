import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/widgets/CustomCircleAvatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
class FaceOrGoogle extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
         Text("- OR CONTINUE WITH -",style: Styles.Montserratgrey16w300,),
        SizedBox(
          height:MediaQuery.of(context).size.height/23,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomCircleAvatar(img: "assets/Images/google 1.png",ontap: ()async{
             await BlocProvider.of<SignUpCubit>(context).signInWithGoogle();
              GoRouter.of(context).pushReplacement("/HomeView");
            },
            ),
          ],
        )
      ],
    );
  }
}