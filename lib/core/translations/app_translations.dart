import 'package:flutter/material.dart';
import 'package:todo_hive/core/providers/language_provider.dart';
import 'package:todo_hive/core/translations/translations/en_translations.dart';
import 'package:todo_hive/core/translations/translations/es_translations.dart';
import 'package:todo_hive/core/translations/translations/pt_translations.dart';
import 'package:todo_hive/core/translations/translations/zh_translations.dart';

class AppTranslations {
  static Map<String, String> getTranslations(AppLanguage language) {
    switch (language) {
      case AppLanguage.portuguese:
        return ptTranslations;
      case AppLanguage.english:
        return enTranslations;
      case AppLanguage.spanish:
        return esTranslations;
      case AppLanguage.chinese:
        return zhTranslations;
    }
  }

  static String translate(BuildContext context, String key) {
    final locale = Localizations.localeOf(context);
    final language = _getLanguageFromLocale(locale);
    final translations = getTranslations(language);
    
    return translations[key] ?? key;
  }

  static AppLanguage _getLanguageFromLocale(Locale locale) {
    final languageCode = locale.languageCode;
    
    switch (languageCode) {
      case 'pt':
        return AppLanguage.portuguese;
      case 'en':
        return AppLanguage.english;
      case 'es':
        return AppLanguage.spanish;
      case 'zh':
        return AppLanguage.chinese;
      default:
        return AppLanguage.english;
    }
  }
}
