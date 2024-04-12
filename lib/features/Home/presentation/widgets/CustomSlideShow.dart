import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomSlideShow extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    List<String>images=[
      "assets/Images/img_3.png",
      "assets/Images/img_1.png",
      'assets/Images/img_4.png'

    ];
    return
      SizedBox(
        height: 140.h,
        width: double.infinity,
        child: CarouselSlider.builder(itemCount: images.length, itemBuilder:
            (context, index, realIndex) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 5.h),
            height: 100.h,
            width: MediaQuery.of(context).size.width,

            child: Image.asset(images[index],width: double.infinity,fit: BoxFit.cover,height: 80,),
          );
        }, options: CarouselOptions(

            autoPlay: true,
            animateToClosest: true,
            scrollDirection: Axis.horizontal
        )
        ),
      );
  }

}