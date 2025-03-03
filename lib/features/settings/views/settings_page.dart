import 'package:flutter/material.dart';
import 'package:todo_hive/core/utils/constants/app_strings.dart';
import 'package:todo_hive/features/settings/components/section_header.dart';
import 'package:todo_hive/features/settings/views/language_page.dart';
import 'package:todo_hive/features/settings/views/theme_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    const double minTileHeight = 20.0;

    return Scaffold(
      body: ListView(
        children: [
          // Preferences Section
          SectionHeader(
            title: AppStrings.getSettingsPreferences(context),
          ),
          ListTile(
            minVerticalPadding: minTileHeight,
            leading: const Icon(Icons.palette_outlined),
            title: Text(AppStrings.getSettingsTheme(context)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const ThemePage(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            minVerticalPadding: minTileHeight,
            leading: const Icon(Icons.language_outlined),
            title: Text(AppStrings.getSettingsLanguage(context)),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const LanguagePage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
