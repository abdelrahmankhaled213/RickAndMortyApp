import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/core/injection/injectionservice.dart';
import 'package:ecommerce_app/features/Cart/CartHomeScreenView.dart';
import 'package:ecommerce_app/features/Favourites/Data/FavRepo/Favrepo.dart';
import 'package:ecommerce_app/features/Favourites/presentation/Ui/FavouritesScreenView.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Home/Data/Repo/homerepo.dart';
import 'package:ecommerce_app/features/Home/presentation/Ui/homescreenview.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Search/SearchHomeScreenView.dart';
import 'package:ecommerce_app/features/Settings/SettingsScreenView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigationBarView extends StatefulWidget {
  @override
  State<BottomNavigationBarView> createState() => _BottomNavigationBarViewState();
}

class _BottomNavigationBarViewState extends State<BottomNavigationBarView> {
List<Widget>screens=[
  BlocProvider(
       create: (context) =>
           HomeCubit(getitinstance<HomeRepo>()),
      child: HomeScreenView()),

  BlocProvider(create: (context) => FavCubit(getitinstance<FavRepo>()),
      child: FavouritesScreenView()),
  CartScreenView(),
  SearchScreenView(),
  SettingsScreenView()
];
var currentindex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 76.h,
        width: 375.w,
        child: BottomNavigationBar(unselectedFontSize: 10.sp,backgroundColor: Colors.white,type: BottomNavigationBarType.fixed,elevation: 0.0,selectedLabelStyle: Styles.Montserratblack24w700.copyWith(
          fontSize: 10.sp
        ),currentIndex: currentindex,selectedItemColor: AppColor.customred,onTap: (value) {
          currentindex=value;
          setState(() {

          });
        },
          items: [
          BottomNavigationBarItem
            (icon:  Icon(Icons.home,size: 24.h,),label: "home"),
          BottomNavigationBarItem(icon:  Icon(Icons.favorite_border,size: 24.h,),label: "favourites"),
          BottomNavigationBarItem(icon:  CircleAvatar(backgroundColor: currentindex==2?AppColor.customred:Colors.white,radius: currentindex==2?23.r:20.r,child: Icon(Icons.shopping_cart,size: 24.h,color:currentindex==2? Colors.white:Colors.black,)),label: "",backgroundColor: Colors.white),
          BottomNavigationBarItem(icon: Icon(Icons.search,size: 24.h,),label: "search"),
          BottomNavigationBarItem(icon: Icon(Icons.settings,size: 24.h,),label: "settings"),
        ],
        ),
      ),
      body: screens[currentindex],
    );
  }
}
