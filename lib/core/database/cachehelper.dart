import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

  static late SharedPreferences sharedPref;

  intializeSharedPref()async{
    sharedPref=await SharedPreferences.getInstance();
  }

  Future<void> setBoolean(bool state)async{
    await sharedPref.setBool("state", state);
  }
  Future<bool?> getBoolean() async{
    return Future.value( sharedPref.getBool("state"));
  }
  Future<bool>clearData()async{
    return await sharedPref.clear();
  }
}