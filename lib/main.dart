import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';
import 'package:rickandmoartymovieapp/core/networking/Networking_Bloc.dart';
import 'package:rickandmoartymovieapp/core/routes/router.dart';

void main() {
  runApp(DevicePreview(
    builder: (BuildContext context) {
      return const MyApp();
    },
    enabled: !kReleaseMode,

  ) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) => NetworkingBloc(),
        child: MaterialApp.router(
          theme: ThemeData(
              scaffoldBackgroundColor: AppColor.grey
          ),
          debugShowCheckedModeBanner: false,
          routerConfig: router,
        ),
      );
  }
}