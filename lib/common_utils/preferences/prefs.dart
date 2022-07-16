import 'package:yalla_shopping/common_utils/preferences/helper.dart';
import 'package:yalla_shopping/common_utils/res/CONST.dart';
import 'package:yalla_shopping/common_utils/res/language_manager.dart';

class Prefs {
  static Future setIsLogin(bool value) =>
      PreferencesHelper.setBool(Const.IS_LOGIN, value);

  static Future<bool> get getIsLogin =>
      PreferencesHelper.getBool(Const.IS_LOGIN);

  static Future setAppLocal(String value) =>
      PreferencesHelper.setString(Const.APP_LOCAL, value);

  static Future<String> getAppLocal() async {
    String lang = await PreferencesHelper.getString(Const.APP_LOCAL);

    if (lang != null && lang.isNotEmpty && lang != "") {
      return lang;
    } else {
      return LanguageType.ENGLISH.getValue();
    }
  }
}
