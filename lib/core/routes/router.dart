import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/BottomNavigationBar/bottomNavigation.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Favourites/presentation/Ui/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/Data/Repo/homerepo.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/DetailsHomeScreen.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/homescreenview.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Login/presentation/UI/Forgot%20Password.dart';
import 'package:ecommerce_app/features/Login/presentation/UI/LoginView.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Ui/SignUpView.dart';
import 'package:ecommerce_app/features/SplashScreen/SplashScreen.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/Ui/OnBoardingView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final  GoRouter gorouter=GoRouter(
    routes: [
      GoRoute(path: "/",builder: (context, state) => SplashScreen(),),
      // GoRoute(path: "/DetailsHomeScreen/:index",builder: (context, state) => BlocProvider(
      //   create: (context) => FavCubit(getitinstance<FavRepo>()),
      //   child: DetailsHomeScreen(
      //    index: state.pathParameters['index']!as int,
      //     data: state. extra as HomeData,),
      // ),
      // ),
GoRoute(path: "/FavouriteScreenView",builder: (context, state) => FavouritesScreenView(),),
      GoRoute(path: "/OnBoardingView",builder: (context, state) => OnBoardingView(),),
      GoRoute(path: "/HomeScreenView",builder: (context, state) => HomeScreenView(),),
      GoRoute(path: "/SignUpView",builder: (context, state) =>
          BlocProvider(create:(context) => SignUpCubit() ,child: SignUpView()),),
      GoRoute(path: "/BottomNavigationView",builder: (context, state) => BottomNavigationBarView(),),
      GoRoute(path: "/LoginView",builder: (context, state) =>
          BlocProvider(create: (context) => LoginCubit(),child: LoginScreenView()),),
          GoRoute(path: "/ForgotPasswordView",builder: (context, state) =>
              BlocProvider(create: (context)
          => LoginCubit(),child:  ForgotPassword()),)
]);
void goPush(String location,BuildContext context ,{Object? object}){
  GoRouter.of(context).push(location,extra: object??null);
}
void goPushReplacement(String location,BuildContext context){
  GoRouter.of(context).pushReplacement(location);
}