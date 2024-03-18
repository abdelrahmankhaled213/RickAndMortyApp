import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future waitSplash(BuildContext context)async{
  return await Future.delayed(
    const Duration(
        seconds: 2
    ),
        () async{
         final instance= await CacheHelper().getBoolean()??false;
     if(instance==false)
       GoRouter.of(context).pushReplacement("/OnBoardingView");
     else{
       GoRouter.of(context).pushReplacement("/SignUpView");
     }
    },
  );
}