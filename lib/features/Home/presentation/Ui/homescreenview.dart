import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_cubit.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_state.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuidCustomAppBar.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/BuildList.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomGridView.dart';
import 'package:ecommerce_app/features/Home/presentation/widgets/CustomSlideShow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class HomeScreenView extends StatefulWidget {


  @override
  State<HomeScreenView> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }
   List<HomeData> data=[];
   getData()async{
     data=await BlocProvider.of<HomeCubit>(context).getHomeData();
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: CustomScrollView(
            // shrinkWrap: true,
            slivers: [
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: BuildCustomAppBar(),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Text("All Featured",style: Styles.Montserratgrey16w300.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black
                ),)
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 10.h,
                ),
              ),
              SliverToBoxAdapter(
                child: BuildListViewCircleAvaters(

              ),
              ),
              SliverToBoxAdapter(
                child: CustomSlideShow(
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 12.h,
                ),
              ),
              SliverToBoxAdapter(
                  child: Text("Sales 25%",style: Styles.Montserratgrey16w300.copyWith(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),)
              ),
              SliverToBoxAdapter(
                  child:
                  BlocConsumer<HomeCubit,HomeState>(
                    listener: (context, state) {
                      if (state is HomeLoadingState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor: Colors.amber, content: Text(
                                "loading")));
                      }
                      if (state is HomeLoadedState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.amber, content: Text(data.length.toString())));
                      }
                      if (state is HomeFaliureState) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            backgroundColor: Colors.amber, content: Text(state
                            .msg)));
                      }
                    },
                    builder: (context, state) =>
                    CustomGridView(
                      data: data,
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}