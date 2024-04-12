import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';

abstract class HomeState{

}
class InitHomeState extends HomeState{

}
class HomeLoadingState extends HomeState{

}
class HomeLoadedState extends HomeState{
late List<HomeData>data;
HomeLoadedState({
  required this.data
});
}
class HomeFaliureState extends HomeState{
String msg;
HomeFaliureState({
  required this.msg
});
}
class AddFavouriteState extends HomeState{

}
class DeleteFavouriteState extends HomeState{

}
class RemoveFavouriteState extends HomeState{
}

