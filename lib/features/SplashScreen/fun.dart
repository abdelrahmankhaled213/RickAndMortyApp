import 'package:ecommerce_app/core/database/cachehelper.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future waitSplash(BuildContext context)async{
  return await Future.delayed(
    const Duration(
        seconds: 2
    ),
        () async{
         final instance= await getitinstance<CacheHelper>().getBoolean()??false;
     if(instance==false)
     goPushReplacement("/OnBoardingView", context);
     if (instance==true){
       FirebaseAuth.instance.currentUser!.emailVerified&&
           FirebaseAuth.instance.currentUser!=null?
       goPushReplacement("/BottomNavigationView", context):
           goPushReplacement("/SignUpView", context);

     }
    },
  );
}