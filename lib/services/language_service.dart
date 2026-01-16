import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../utils/constants.dart';

class LanguageService extends ChangeNotifier {
  Locale _locale = const Locale('en');

  Locale get locale => _locale;
  bool get isTurkish => _locale.languageCode == 'tr';

  LanguageService() {
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = prefs.getString(AppConstants.languageKey);
    if (languageCode != null) {
      _locale = Locale(languageCode);
      notifyListeners();
    }
  }

  Future<void> setLocale(Locale locale) async {
    _locale = locale;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(AppConstants.languageKey, locale.languageCode);
  }

  void toggleLanguage() {
    setLocale(_locale.languageCode == 'tr' ? const Locale('en') : const Locale('tr'));
  }
}

