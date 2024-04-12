abstract class FavState{

}
class InitialState extends FavState{

}
class GetFavDocuments extends FavState{
List<String>Documents;
GetFavDocuments({
  required this.Documents
});
}
class GetLoadingFavState extends FavState{

}
class GetLoadedFavState extends FavState{

}
class GetFaliureFavState extends FavState{
   String errormsg;
   GetFaliureFavState({
    required this.errormsg
});
}
class AddFavState extends FavState{

}
class RemoveFavState extends FavState{

}