import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:rickandmoartymovieapp/features/Characters/Data/Model/CharacterModel.dart';

abstract class ApiServices{
   Future<CharacterModel?>getAllCharacters();

 }
