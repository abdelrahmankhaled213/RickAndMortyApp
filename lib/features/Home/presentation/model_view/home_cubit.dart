import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/Home/Data/Model/getData.dart';
import 'package:ecommerce_app/features/Home/Data/webservices/services.dart';
import 'package:ecommerce_app/features/Home/presentation/model_view/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final Services services;

  HomeCubit(this.services) :super(InitHomeState());
  Future<List<HomeData>> getHomeData() async {
    emit(HomeLoadingState());
    try {
      var menslist = await services.getMensCategory();
      emit(HomeLoadedState(data: menslist));
      return menslist;
    }
    catch (e) {
      emit(HomeFaliureState(msg: e.toString()));
      return [];
    }

  }



}



