import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class BuildListViewCircleAvaters extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(scrollDirection: Axis.horizontal,itemBuilder: (context, index) {

        return Column(
            children: [
              CircleAvatar(
                radius: 25.r,


                backgroundImage: AssetImage(categorymodel[index].image),
              ),
              SizedBox(height: 2.h,),
              Text(categorymodel[index].name,style: Styles.Montserratgrey16w300.copyWith(
                color: AppColor.customPurple,
              ),)
            ]);
      }, separatorBuilder: (context, index) {
        return SizedBox(width: 15.w,);
      }, itemCount: categorymodel.length),
    );
  }


}