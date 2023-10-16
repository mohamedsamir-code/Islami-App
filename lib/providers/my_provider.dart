import 'package:flutter/material.dart';
import '../screens/bottomSheets/language_bottom_sheet.dart';
import '../screens/bottomSheets/themeing_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyProvider extends ChangeNotifier {
  String appLanguage = "en";
  ThemeMode appMode = ThemeMode.light;
  int index = 0;
  SharedPreferences? preferences;
  final String themeKey = 'theme';
  final String languageKey = 'language';

  String? getTheme() {
    return preferences!.getString(themeKey);
  }

  String? getLanguage() {
    return preferences!.getString(languageKey);
  }

  Future<void> saveTheme(ThemeMode themeMode) async {
    String themeValue = (themeMode == ThemeMode.light ? 'light' : 'dark');
    await preferences!.setString(themeKey, themeValue);
  }

  Future<void> saveLanguage(String newLanguage) async {
    preferences!.setString(languageKey, newLanguage);
  }

  Future<void> loadSettingConfig() async {
    preferences = await SharedPreferences.getInstance();
    String? themeMode = getTheme();
    String? lang = getTheme();
    if (themeMode != null) {
      appMode = (themeMode == 'light' ? ThemeMode.light : ThemeMode.dark);
    }
    if (lang != null) {
      appLanguage = lang;
    }
  }

  void changeLanguage(String langCode) {
    appLanguage = langCode;
    notifyListeners();
    saveLanguage(langCode);
  }

  void changeThemeMode(ThemeMode mode) {
    appMode = mode;
    // if (appMode == ThemeMode.light) {
    //   appMode = ThemeMode.dark;
    // } else {
    //   appMode = ThemeMode.light;
    // }
    notifyListeners();
    saveTheme(mode);
  }

  String getBackgrund() {
    if (appMode == ThemeMode.light) {
      return 'assets/images/background.png';
    } else {
      return 'assets/images/background_dark.png';
    }
  }

  showLanguageBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => LanguageBottomSheet(),
    );
  }

  showThemeingBottomSheet(context) {
    showModalBottomSheet(
      context: context,
      useSafeArea: true,
      isScrollControlled: true,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
          borderSide: const BorderSide(
            color: Colors.transparent,
          )),
      builder: (context) => ThemeingBottomSheet(),
    );
  }

  bottomNavCurrent(value) {
    index = value;
    notifyListeners();
  }
}
