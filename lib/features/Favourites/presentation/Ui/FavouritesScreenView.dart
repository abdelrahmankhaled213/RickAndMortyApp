import 'package:ecommerce_app/core/Utills/colors.dart';
import 'package:ecommerce_app/core/Utills/styles.dart';
import 'package:ecommerce_app/core/routes/router.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_cubit.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class FavouritesScreenView extends StatefulWidget {
  @override
  State<FavouritesScreenView> createState() => _FavouritesScreenViewState();
}

class _FavouritesScreenViewState extends State<FavouritesScreenView> {
   var lista=<HomeData>[];
   var DocumentsList=<String>[];
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    getFavourites();
  }
  getFavourites()async{
    lista=await BlocProvider.of<FavCubit>(context).getFavourite();
    DocumentsList=await BlocProvider.of<FavCubit>(context).getAllDocuments();
    print(DocumentsList.length);
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      
      body: SafeArea(
          child:
      BlocConsumer<FavCubit,FavState>(
        listener: (context, state) {
          if(state is GetLoadedFavState)
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${lista.length}")));
        },
        builder: (context, state) {
          return
           lista.length==0?Center(child: Text("No Favourites Added",style: Styles.LibreCaskonpink40bold)):  SizedBox(
               width: double.infinity,
               child: ListView
                .builder(
                           itemCount: lista.length, itemBuilder: (context, index) {
                           return CustomFavouriteContainer(
                             index: index,
                documents: DocumentsList,
                data: lista[index],
                           );
                         },
                         ),
             );

        })
      ),
    );
  }
}

class CustomFavouriteContainer extends StatelessWidget {
  HomeData data;
  int index;
  List<String>documents;
  CustomFavouriteContainer({
   required this.data,
    required this.index,
    required this.documents
});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Container(
     height: 200.h,
     width:double.infinity ,
     child: CustomRowFavourite(
       data: data,
       index: index,
       documents: documents,
     ),
   );
  }

}

class CustomRowFavourite extends StatelessWidget{
  HomeData data;
  int index;
  List<String>documents;
  CustomRowFavourite({
    required this.index,
    required this.data,
    required this.documents
});
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavCubit>(context).favstate=false;
   return Row(
     mainAxisAlignment: MainAxisAlignment.start,
     children: [
       Column(
         children: [
           Image.network(data.image,height: 100.h,
           width: 300.w,fit: BoxFit.fitHeight,),
           SizedBox(
             width: 5.w,
           ),
           SizedBox(
             height: 50.h,
             width: 100.w,
             child: Text(data.name,style: Styles.Montserratgrey16w300.copyWith(
                 color: AppColor.customred
             ),),
           ),
         ],
       ),

      GestureDetector (onTap:()async{

        await BlocProvider.of<FavCubit>(context).removeFavourites(documents[index]);
         goPushReplacement("/FavouriteScreenView", context);
    }  ,child: Icon(Icons.remove_circle,color: AppColor.customred,size: 30.sp,))
   ]);
  }
// onTapRemove(BuildContext context){

// }
}
