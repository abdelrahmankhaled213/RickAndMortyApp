import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
abstract class CharacterState{
}
class InitialState extends CharacterState{
}
class LoadingState extends CharacterState{
}
class LoadedState extends CharacterState{
CharacterModel characterModel;
LoadedState({
  required this.characterModel
});
}
class FaliureState extends CharacterState{
String faliuremsg;
FaliureState(
{
  required this.faliuremsg
}
    );
}



