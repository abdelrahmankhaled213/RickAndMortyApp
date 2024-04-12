import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/customcontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DetailsHomeScreen extends StatefulWidget {
  HomeData? data;
  DetailsHomeScreen({
    this.data,
  });

  @override
  State<DetailsHomeScreen> createState() => _DetailsHomeScreenState();
}
class _DetailsHomeScreenState extends State<DetailsHomeScreen> {
  var id='';
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child:
                    BlocConsumer<FavCubit,FavState>(
                listener: (context, state) {
                },
                builder: (context, state) {
                  return Stack(
                    children: [
                      Image.network(
                        widget.data!.image
                        ,height: 300.h
                        , width:double.infinity,fit: BoxFit.fitWidth,),
                      Positioned(
                        child: GestureDetector(
                          onTap: () async{

                            if( BlocProvider.of<FavCubit>(context).favstate==false)
                            id=await BlocProvider.of<FavCubit>(context).addFavourites(widget.data!);
                           else if(BlocProvider.of<FavCubit>(context).favstate==true)
                              await BlocProvider.of<FavCubit>(context).removeFavourites(id);
                          },
                          child:
                          Icon(BlocProvider.of<FavCubit>(context).favstate?Icons.favorite:Icons.favorite_border,
                            size: 30.h,
                          ),
                        )
                        ,right: 5,
                        top: 5,)
                    ],

                  );
                },
                )
                ),
                SliverToBoxAdapter(
                  child: DetailsWidget(
                    data: widget.data!,
                  ),
                )

              ],
            ),
          )
      );
  }
}



class DetailsWidget extends StatelessWidget {
 final HomeData data;
  DetailsWidget({
    required this.data
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 10.w
      ),
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(data.name, style: Styles.Montserratgrey16w300.copyWith(
                fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Sizes", style: Styles.Montserratgrey16w300.copyWith(
                    fontWeight: FontWeight.w600
                ),),
                SizedBox(height: 12.h,),
                Align(alignment: Alignment. centerLeft,child: CustomListView(data: data,)),
              ],
            ),
                Row(
                  children: [
                    CustomContainer(width: 40.w
                        ,
                        height: 20.h,
                        color: AppColor.customblue,
                        radius: 25.r,
                        text: "+"),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 3.w,
                    ),
                    CustomContainer(width: 40.w
                        ,
                        height: 20.h,
                        color: AppColor.customblue,
                        radius: 25.r,
                        text: "-"),
                  ],
                ),
              ],
          ),

          ]
      )
    );
  }
}

class CustomListView extends StatelessWidget{
  HomeData data;
  CustomListView({
    required this.data
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      width: 120.w,
      child: ListView.separated(separatorBuilder: (context, index) {
        return SizedBox(
          width: 5.w,
        );
      },scrollDirection: Axis.horizontal,itemCount: data.size.length,itemBuilder: (context, index) {
        return CustomContainer(
            width: 25.w,
            height: 10.h,
            color: AppColor.customblue, radius: 25.r,
            text: data.size["size${index+1}"]);
      },
      ),
    );
  }

}




