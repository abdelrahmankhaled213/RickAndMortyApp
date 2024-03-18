import 'package:ecommerce_app/features/GetStarted/GetStarted.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/homescreenview.dart';
import 'package:ecommerce_app/features/Login/presentation/UI/LoginView.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Model_View/cubit.dart';
import 'package:ecommerce_app/features/SignUp/presentation/Ui/SignUpView.dart';
import 'package:ecommerce_app/features/SplashScreen/SplashScreen.dart';
import 'package:ecommerce_app/features/onBoardingScreen/Presentation/Ui/OnBoardingView.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final  GoRouter gorouter=GoRouter(
    routes: [
      GoRoute(path: "/",builder: (context, state) => SplashScreen(),),
      GoRoute(path: "/OnBoardingView",builder: (context, state) => OnBoardingView(),),
      GoRoute(path: "/HomeScreenView",builder: (context, state) => HomeScreenView(),),
      GoRoute(path: "/GetStarted",builder: (context, state) => GetStarted(),),
      GoRoute(path: "/SignUpView",builder: (context, state) =>
          BlocProvider(create:(context) => SignUpCubit() ,child: SignUpView()),),
      GoRoute(path: "/LoginView",builder: (context, state) =>
          BlocProvider(create: (context) => LoginCubit(),child: LoginScreenView()),), GoRoute(path: "/HomeView",builder: (context, state) => HomeScreenView(),)
]);