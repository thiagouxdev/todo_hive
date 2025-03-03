import 'package:flutter/material.dart';
import 'package:todo_hive/core/routes/app_routes.dart';
import 'package:todo_hive/core/services/preferences_service.dart';

import '../../../../core/utils/constants/app_image_strings.dart';
import '../../../../core/utils/constants/app_strings.dart';
import '../../../../core/utils/helpers/app_helper_functions.dart';
import '../../../settings/views/language_page.dart';
import '../../../settings/views/theme_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert),
              onSelected: (value) {
                if (value == 'language') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LanguagePage()),
                  );
                } else if (value == 'theme') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThemePage()),
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'language',
                  child: Row(
                    children: [
                      const Icon(Icons.language, size: 20),
                      const SizedBox(width: 8),
                      Text(AppStrings.getSettingsLanguage(context)),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'theme',
                  child: Row(
                    children: [
                      const Icon(Icons.palette_outlined, size: 20),
                      const SizedBox(width: 8),
                      Text(AppStrings.getSettingsTheme(context)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImages.load(
                  AppHelperFunctions.isDarkMode(context)
                      ? AppImages.appLogoDark
                      : AppImages.appLogoLight,
                  width: 156,
                  height: 156,
                ),
                const SizedBox(height: 24),
                Text(
                  AppStrings.getWelcomeTitle(context),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  AppStrings.getWelcomeDescription(context),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 48),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 412),
                  child: SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: FilledButton(
                      onPressed: () async {
                        // Salva a flag indicando que o usuário já viu a tela de Welcome
                        await PreferencesService.setHasSeenWelcome(true);
                        Navigator.pushReplacementNamed(context, AppRoutes.home);
                      },
                      child: Text(AppStrings.getStartButton(context)),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Botão temporário para resetar a flag
                TextButton(
                  onPressed: () async {
                    await PreferencesService.setHasSeenWelcome(false);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Flag resetada para false!')),
                    );
                  },
                  child: const Text('Resetar Welcome (Teste)'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
