import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  late final SharedPreferences _sharedPreferences;
  Future<StorageService> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString({required String key, required String value}) async {
    return await _sharedPreferences.setString(key, value);
  }
}
