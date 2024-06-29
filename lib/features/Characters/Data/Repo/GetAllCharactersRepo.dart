import 'dart:convert';
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';
import 'package:rickandmoartymovieapp/features/Characters/Data/webServices/Character_home.dart';
import 'package:http/http.dart'as http;
class GetAllCharactersRepo implements ApiServices{
  @override
  Future<CharacterModel?> getAllCharacters() async{
    {
      final client = http.Client();
      try {
        final response = await client.get(
            Uri.parse("https://rickandmortyapi.com/api/character"));
        final character = CharacterModel.fromJson(jsonDecode(response.body));
        return character;
      } catch (e) {
        print(e);
      }
    }

  }



}