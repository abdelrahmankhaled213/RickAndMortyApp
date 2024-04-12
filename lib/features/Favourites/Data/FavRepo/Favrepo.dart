import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Favourites/Data/services/favservices.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
class FavRepo implements FavServices{
  var firestoreinstance=FirebaseFirestore.instance.collection("favourites");

  @override
  Future<List<HomeData>> getFavData() async{
  var favdata=<HomeData>[];
    await firestoreinstance.get().then((value) {

      return value.docs.forEach((element) {
        favdata.add(HomeData.fromJson(element.data()));
      });
    });
    return favdata;
  }

  @override
  int removeItemFromFavourites(String id) {
    // TODO: implement removeItemFromFavourites
   firestoreinstance.doc(id).delete();
    return 0;
  }

  @override
  Future<String> addItemToFavourites(HomeData data) async{
var addedid=await firestoreinstance.add(data.toJson()).
then((DocumentReference reference) => reference.id);
return addedid;
  }

  @override
  Future<List<String>> getAllDocuments() async{
    var doc=<String>[];
    await firestoreinstance.get().then((value) {
      for(int i=0;i<value.docs.length;i++){
        doc.add(value.docs[i].id);
      }
    }
    );
    return Future.value(doc);
  }
}