import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_hive/core/utils/constants/app_strings.dart';
import 'package:todo_hive/core/providers/theme_provider.dart';

class ThemePage extends ConsumerWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double minTileHeight = 20.0;
    final currentTheme = ref.watch(themeProvider);
    final themeNotifier = ref.read(themeProvider.notifier);

    void changeTheme(ThemeMode mode) {
      themeNotifier.setThemeMode(mode);
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            title: Text(AppStrings.getSettingsTheme(context)),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ListTile(
                minVerticalPadding: minTileHeight,
                leading: const Icon(Icons.smartphone_outlined),
                title: Text(AppStrings.getThemeSystem(context)),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.system,
                  groupValue: currentTheme,
                  onChanged: (ThemeMode? mode) {
                    if (mode != null) {
                      changeTheme(mode);
                    }
                  },
                ),
                onTap: () => changeTheme(ThemeMode.system),
              ),
              const Divider(),
              ListTile(
                minVerticalPadding: minTileHeight,
                leading: const Icon(Icons.light_mode_outlined),
                title: Text(AppStrings.getThemeLight(context)),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.light,
                  groupValue: currentTheme,
                  onChanged: (ThemeMode? mode) {
                    if (mode != null) {
                      changeTheme(mode);
                    }
                  },
                ),
                onTap: () => changeTheme(ThemeMode.light),
              ),
              const Divider(),
              ListTile(
                minVerticalPadding: minTileHeight,
                leading: const Icon(Icons.dark_mode_outlined),
                title: Text(AppStrings.getThemeDark(context)),
                trailing: Radio<ThemeMode>(
                  value: ThemeMode.dark,
                  groupValue: currentTheme,
                  onChanged: (ThemeMode? mode) {
                    if (mode != null) {
                      changeTheme(mode);
                    }
                  },
                ),
                onTap: () => changeTheme(ThemeMode.dark),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
