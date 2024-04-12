import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';

abstract class FavServices{
  Future<List<HomeData>>getFavData();
  int removeItemFromFavourites(String id);
  Future<String> addItemToFavourites(HomeData data );
 Future<List<String>> getAllDocuments();
}