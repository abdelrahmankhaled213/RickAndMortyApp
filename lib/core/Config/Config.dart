import 'dart:convert';
import 'dart:ui';

import 'package:flutter/services.dart';

abstract class Config{
  static Map<String,dynamic> localization={};
  static LoadLang(String lang) async {
    String translation;
    if(lang=="ar")
      translation=await rootBundle.loadString("assets/Localization/ar.json");
    else
      translation=await rootBundle.loadString("assets/Localization/en.json");

 localization= jsonDecode(translation);
  }

}