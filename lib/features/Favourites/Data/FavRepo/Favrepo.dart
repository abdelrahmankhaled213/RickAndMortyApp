import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Favourites/Data/services/favservices.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';

class FavRepo implements FavServices{
  var favdata=<HomeData>[];

  var firestoreinstance=FirebaseFirestore.instance.collection("favourites");
  @override
  Future<List<HomeData>> getFavData() async{

    await firestoreinstance.get().then((value) {

      return value.docs.forEach((element) {
        favdata.add(HomeData.fromJson(element.data()));
      });
    });
    return favdata;
  }

  @override
  int removeItemFromFavourites(HomeData data) {
    // TODO: implement removeItemFromFavourites
   firestoreinstance.doc().delete();
    return 0;
  }

  @override
  void addItemToFavourites(HomeData data) {
firestoreinstance.add(data.toJson()).then((DocumentReference reference) => print(reference.id));
  }
}