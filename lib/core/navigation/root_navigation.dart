import 'package:flutter/material.dart';
import 'package:todo_hive/core/utils/constants/app_strings.dart';
import 'package:todo_hive/core/routes/app_routes.dart';
import 'package:todo_hive/features/todo/presentation/views/todo_page.dart';
import 'package:todo_hive/features/settings/views/settings_page.dart';

class RootNavigation extends StatefulWidget {
  const RootNavigation({super.key});

  @override
  State<RootNavigation> createState() => _RootNavigationState();
}

class _RootNavigationState extends State<RootNavigation> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = [
    const TodoPage(),
    const SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get translated titles
    final List<String> titles = [
      AppStrings.getTodo(context),
      AppStrings.getSettings(context),
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          titles[_selectedIndex],
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          // Navegar para welcome page
          IconButton(
              icon: const Icon(Icons.logout_outlined),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.welcome);
              }),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: Theme.of(context).colorScheme.outlineVariant,
            height: 0,
            thickness: 0.5,
          ),
          NavigationBar(
            backgroundColor: Theme.of(context).colorScheme.surface,
            indicatorColor: Colors.transparent,
            overlayColor: WidgetStateColor.transparent,
            selectedIndex: _selectedIndex,
            onDestinationSelected: _onItemTapped,
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.fact_check_outlined),
                selectedIcon: const Icon(Icons.fact_check),
                label: titles[0],
              ),
              NavigationDestination(
                icon: const Icon(Icons.settings_outlined),
                selectedIcon: const Icon(Icons.settings),
                label: titles[1],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
