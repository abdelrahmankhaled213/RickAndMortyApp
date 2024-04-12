import 'package:ecommerce_app/features/Favourites/Data/services/favservices.dart';
import 'package:ecommerce_app/features/Favourites/presentation/model_view/fav_state.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<FavState>{
  FavServices services;
  FavCubit(this.services):super(InitialState());
   bool favstate=false;
  Future<List<HomeData>>getFavourite()async{
   emit(GetLoadingFavState());
   try{
   var lista=await services.getFavData();
   emit(GetLoadedFavState());
   return lista;
   }on FirebaseAuthException
   catch(e){
     emit(GetFaliureFavState(errormsg: e.code));
     return [];
   }


  }
 removeFavourites(String id)async{
     await services.removeItemFromFavourites(id);
    favstate=false;
    emit(RemoveFavState());
}
Future<String> addFavourites(HomeData data)async{
        var id=await services.addItemToFavourites(data);
      favstate=true;
    emit(AddFavState());
    return id;
}
Future<List<String>> getAllDocuments()async{
    try {
     var doclist= await services.getAllDocuments();
      emit(GetFavDocuments(Documents:doclist ));
      return doclist;
    }catch(e){

    }
    return [];
}
}