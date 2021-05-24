import 'package:shared_preferences/shared_preferences.dart';

///
/// @author: maker
/// @date: 2021/5/17 10:36
/// description: 本地数据存储
/// 

class SpUtils{
  static late SharedPreferences _prefs;

  static init() async{
    _prefs = await SharedPreferences.getInstance();
  }

  static save(String key, value) async {
    _prefs.setString(key, value);
  }

  static get(String key) async {
    return _prefs.get(key);
  }

  static remove(String key) async {
    _prefs.remove(key);
  }

  static clear() async{
    _prefs.clear();
  }


}

