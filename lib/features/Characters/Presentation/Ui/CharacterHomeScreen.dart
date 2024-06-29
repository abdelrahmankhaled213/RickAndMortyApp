import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rickandmoartymovieapp/core/Utils/colors.dart';
import 'package:rickandmoartymovieapp/core/networking/Networking_Bloc.dart';
import 'package:rickandmoartymovieapp/core/networking/Networking_State.dart';
import 'package:rickandmoartymovieapp/core/networking/networking_event.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/cubit.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/states.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/widgets/GridView/CustomCircularprogressindicator.dart';
import 'package:rickandmoartymovieapp/features/functions/widgets.dart';
class CharacterHomeScreen extends StatefulWidget {
  @override
  State<CharacterHomeScreen> createState() => _CharacterHomeScreenState();
}
class _CharacterHomeScreenState extends State<CharacterHomeScreen> {
  StreamSubscription?streamSubscription;
  List<Result> container=[];
  var issearching=false;
late CharacterModel characterModel;
  final searchcontroller=TextEditingController();
  void addSearchItem(String whatisbeingtyped){
container=
    characterModel
        .results.where((element)
    => element.name.toLowerCase().startsWith(whatisbeingtyped)).toList();
setState(() {

});
  }
  void stopSearching(){
    searchcontroller.clear();
    issearching=false;
    setState(() {

    });
  }
  List<Widget>builditem(){
    if(issearching==false){
      return [
        IconButton(onPressed: (){
          ModalRoute.of(context)!.addLocalHistoryEntry(
              LocalHistoryEntry(onRemove: stopSearching
          )
          );
          setState(() {
            issearching=true;
          });
        }, icon: const Icon(Icons.search,color: AppColor.grey,size: 18,)
        )
      ];
    }
    else{
      return [
      IconButton(onPressed: (){
      }, icon: const Icon(Icons.close,color: AppColor.grey,size: 18,)
      )
      ];
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
getdata();
     streamSubscription=Connectivity().onConnectivityChanged.listen((event) {
      if(event[0]==ConnectivityResult.wifi||event[0]==ConnectivityResult.mobile){
        context.read<NetworkingBloc>().add(OnlineEvent());
      }
      else{
        context.read<NetworkingBloc>().add(OfflineEvent());
      }
    });
  }
  getdata()async{
    await BlocProvider.of<CharacterCubit>(context).getChar();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkingBloc, NetworkingState>(

  builder: (context, state) {
    return state is  OnlineState?Scaffold(
      appBar: AppBar(

        flexibleSpace: const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
        ),
        backgroundColor: AppColor.yellow,
        actions: builditem(),
        title: issearching==false?
       const Text("Characters",style: TextStyle(
          fontWeight: FontWeight.w600
        ),
        ):buildSearchItem(searchcontroller: searchcontroller,
        addSearchItem: addSearchItem)
      ),
      body:
           CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                    child: BlocConsumer<CharacterCubit,CharacterState>(
                      builder: (context, state) {
                        if(state is LoadingState)
                          return Center(child: CustomCircularProgressIndicator());
                        if(state is LoadedState){
                          characterModel=state.characterModel;
                          return gridBuilder(
                              model: characterModel,
                              state: state,
                              context: context,
                              controller: searchcontroller,
                              container: container);
                        }
                        if(state is FaliureState){
                          Text(state.faliuremsg);
                        }

                        return const SizedBox();
                      },
                      listener: (context, state) {

                      },
                    )
                )
              ],
            )

    ): Scaffold(
      body: Center(
        child: Image.asset("assets/images/Animation - 1719695530572 (1).gif",fit: BoxFit.cover,
        height: 250,),
      ),
    );
  },
);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    streamSubscription!.cancel();
    searchcontroller.dispose();
  }
}
