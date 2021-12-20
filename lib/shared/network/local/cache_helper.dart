import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {

  static late SharedPreferences sharedpreferences;

  static init()async
  {
     sharedpreferences= await SharedPreferences.getInstance();
  }

static Future<bool> putBoolean(
  {
    required String key,
    required bool value
}
    )async
{
  return await sharedpreferences.setBool(key, value);
}
  static bool? getBoolean(
      {
        required String key,
      }
      )
  {
    return  sharedpreferences.getBool(key);
  }

}