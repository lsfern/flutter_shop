import 'package:shared_preferences/shared_preferences.dart';

/// Author: ZWW
/// Date: 2019/8/6 11:55
/// Description: SpUtil

class SpUtil {
  /// SharedPreferences.key
  static String spKey = '';

  static SpUtil _instance = new SpUtil();

  static SharedPreferences sharedPreferences;

  /// init SpUtil
  ///
  /// set SharedPreferences.key [spKey] and init SharedPreferences
  /// return [SpUtil._instance]
  static Future<SpUtil> getInstance(String spKey) async {
    spKey = spKey;
    sharedPreferences = await SharedPreferences.getInstance();
    return _instance;
  }

  /// getString by [spKey]
  String getString() => sharedPreferences.getString(spKey);

  /// setString by [spKey] and [value]
  setString(String value) async =>
      await sharedPreferences.setString(spKey, value);

  /// removeKey by [spKey]
  remove() async => await sharedPreferences.remove(spKey);
}
