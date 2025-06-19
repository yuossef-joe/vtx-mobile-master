import 'package:applocation/presentation/resources/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  static const String _tokenKey = 'auth_token';
  static const String _cardCheck = 'card_check';
  static const String _country = 'country';

  // Save token
  Future<void> saveToken(String token) async {
    print('data saved in local storage');
    await _sharedPreferences.setString(_tokenKey, token);
  }
  // Retrieve token
  Future<String?> getToken() async {
    String? token=_sharedPreferences.getString(_tokenKey);
    return token;
  }

  // Remove token (for logout)
  Future<void> removeToken() async {
    print('removed new token >>>>>>>>> ${await getToken()}');
    await _sharedPreferences.remove(_tokenKey);
  }

  Future<void> setCountry(String country) async{
    await _sharedPreferences.setString(_country, country);
  }
  Future<String?> getCountry() async{
    return _sharedPreferences.getString(_country);
  }

  Future<void> addCard() async{
    await _sharedPreferences.setBool(_cardCheck, true);
  }

  Future<bool?> getCard() async{
    return _sharedPreferences.getBool(_cardCheck);
  }


  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> changeAppLanguage() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      // set english
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ENGLISH.getValue());
    } else {
      // set arabic
      _sharedPreferences.setString(
          PREFS_KEY_LANG, LanguageType.ARABIC.getValue());
    }
  }

  Future<Locale> getLocal() async {
    String currentLang = await getAppLanguage();

    if (currentLang == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCAL;
    } else {
      return ENGLISH_LOCAL;
    }
  }

  // on boarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> isOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  //login

  Future<void> setUserLoggedIn() async {
    _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> clear() async {
    await _sharedPreferences.clear();
  }

  Future<void> logout() async {
    removeToken();
    _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
