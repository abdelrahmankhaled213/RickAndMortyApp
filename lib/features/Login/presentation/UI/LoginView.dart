import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/core/widgets/CustomTextFormField.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit.dart';
import 'package:ecommerce_app/features/Login/presentation/model_view/cubit_state.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/CustomColumn.dart';
import 'package:ecommerce_app/features/Login/presentation/widgets/LoginFormField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreenView extends StatelessWidget {

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
        child: CustomColumn()
      ),
      SliverToBoxAdapter(
        child:  SizedBox(
          height: MediaQuery.of(context).size.height/15,
        ),
      ),
      SliverToBoxAdapter(
        child: LoignFormField(),
      )
    ]
    )
        )
    )
    );
  }
}

