import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/webServices/Character_home.dart';
import 'package:rickandmoartymovieapp/features/Characters/presentation/Model_view/Cubit/states.dart';

class CharacterCubit extends Cubit<CharacterState>{
  final ApiServices apiServices;
  CharacterCubit(
  {
    required this.apiServices
}
      ):super(InitialState());

Future<void>getChar()async{
  try {
    emit(LoadingState());
  final character=await apiServices.getAllCharacters();
emit(
    LoadedState(
  characterModel: character!
));

  }
  catch(e){
    emit(FaliureState(
      faliuremsg: e.toString()
    ));
  }
}



}