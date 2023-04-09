import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices {
  late SharedPreferences _sharedPreferences;
  SharedPreferences get sharedPreferences => _sharedPreferences;
  Future<void> sharedPreferenceInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setOnBoarding(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }

  Future<bool?> getOnBoarding(String key) async {
    return sharedPreferences.getBool(key);
  }
}
