import 'package:flutter/material.dart';
import 'package:todo_hive/core/translations/app_translations.dart';

class AppStrings {
  // App Name
  static const String appName = 'Orbi';
  static String getAppName(BuildContext context) =>
      AppTranslations.translate(context, 'appName');

  // Welcome Page
  static const String welcomeTitle = 'Bem-vindo ao';
  static String getWelcomeTitle(BuildContext context) =>
      AppTranslations.translate(context, 'welcomeTitle');

  // Navigation Titles
  static const String list = 'Todo';
  static String getTodo(BuildContext context) =>
      AppTranslations.translate(context, 'todo');

  static const String settings = 'Configurações';
  static String getSettings(BuildContext context) =>
      AppTranslations.translate(context, 'settings');

  static const String welcomeDescription =
      'Explore todas as funcionalidades \ndo nosso aplicativo';
  static String getWelcomeDescription(BuildContext context) =>
      AppTranslations.translate(context, 'welcomeDescription');

  static const String startButton = 'Começar';
  static String getStartButton(BuildContext context) =>
      AppTranslations.translate(context, 'startButton');

  // List Page
  static const String incrementTooltip = 'Increment';
  static String getIncrementTooltip(BuildContext context) =>
      AppTranslations.translate(context, 'incrementTooltip');
  // Pendente de internacionalização
  static String getLitTest(BuildContext context) => "getLitTest";

  // Settings Page
  static const String settingsEmpty = 'Configurações';
  static String getSettingsEmpty(BuildContext context) =>
      AppTranslations.translate(context, 'settingsEmpty');

  static const String settingsPreferences = 'Preferências';
  static String getSettingsPreferences(BuildContext context) =>
      AppTranslations.translate(context, 'settingsPreferences');

  static const String settingsTheme = 'Tema';
  static String getSettingsTheme(BuildContext context) =>
      AppTranslations.translate(context, 'settingsTheme');

  static const String settingsLanguage = 'Idioma';
  static String getSettingsLanguage(BuildContext context) =>
      AppTranslations.translate(context, 'settingsLanguage');

  static const String seeMore = 'Ver mais';
  static String getSeeMore(BuildContext context) =>
      AppTranslations.translate(context, 'seeMore');

  // Theme Page
  static const String themeSystem = 'Tema do Sistema';
  static String getThemeSystem(BuildContext context) =>
      AppTranslations.translate(context, 'themeSystem');

  static const String themeLight = 'Tema Claro';
  static String getThemeLight(BuildContext context) =>
      AppTranslations.translate(context, 'themeLight');

  static const String themeDark = 'Tema Escuro';
  static String getThemeDark(BuildContext context) =>
      AppTranslations.translate(context, 'themeDark');

  // Language Page
  static const String languagePortuguese = 'Português';
  static String getLanguagePortuguese(BuildContext context) =>
      AppTranslations.translate(context, 'languagePortuguese');

  static const String languageEnglish = 'English';
  static String getLanguageEnglish(BuildContext context) =>
      AppTranslations.translate(context, 'languageEnglish');

  static const String languageSpanish = 'Español';
  static String getLanguageSpanish(BuildContext context) =>
      AppTranslations.translate(context, 'languageSpanish');

  static const String languageChinese = '中文';
  static String getLanguageChinese(BuildContext context) =>
      AppTranslations.translate(context, 'languageChinese');

  static const String searchLanguage = 'Pesquisar idioma';
  static String getSearchLanguage(BuildContext context) =>
      AppTranslations.translate(context, 'searchLanguage');

  // Drawer
  static const String logout = 'Sair';
  static String getLogout(BuildContext context) =>
      AppTranslations.translate(context, 'logout');

  // Status Pages
  static const String success = 'Sucesso';
  static String getSuccess(BuildContext context) =>
      AppTranslations.translate(context, 'success');

  static const String error = 'Erro';
  static String getError(BuildContext context) =>
      AppTranslations.translate(context, 'error');

  static const String tryAgain = 'Tentar novamente';
  static String getTryAgain(BuildContext context) =>
      AppTranslations.translate(context, 'tryAgain');

  static const String continue_ = 'Continuar';
  static String getContinue(BuildContext context) =>
      AppTranslations.translate(context, 'continue');

  static const String goBack = 'Voltar';
  static String getGoBack(BuildContext context) =>
      AppTranslations.translate(context, 'goBack');

  static const String loading = 'Carregando...';
  static String getLoading(BuildContext context) =>
      AppTranslations.translate(context, 'loading');

  // Feature Page
  static const String register = 'Faça seu cadastro';
  static String getRegister(BuildContext context) =>
      AppTranslations.translate(context, 'register');
}
