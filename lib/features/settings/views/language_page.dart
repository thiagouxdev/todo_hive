import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_hive/core/utils/constants/app_strings.dart';
import 'package:todo_hive/core/providers/language_provider.dart';

import '../../../core/shared/widget/custom_search_bar.dart';

class LanguagePage extends ConsumerStatefulWidget {
  const LanguagePage({super.key});

  @override
  ConsumerState<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends ConsumerState<LanguagePage> {
  final List<AppLanguage> _allLanguages = AppLanguage.values;
  late List<AppLanguage> _filteredLanguages;

  @override
  void initState() {
    super.initState();
    _filteredLanguages = _allLanguages;
  }

  void _filterLanguages(String query) {
    if (query.isEmpty) {
      _filteredLanguages = _allLanguages;
    } else {
      _filteredLanguages = _allLanguages.where((language) {
        return language.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);

    void changeLanguage(AppLanguage language, SearchController controller) {
      languageNotifier.setLanguage(language);
      controller.clear();
      controller.closeView('');
      FocusManager.instance.primaryFocus?.unfocus();
    }

    Widget buildLanguageItem(
        AppLanguage language, SearchController? controller) {
      return Container(
        height: 64.0,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                language.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Radio<AppLanguage>(
              value: language,
              groupValue: currentLanguage,
              onChanged: (AppLanguage? mode) {
                if (mode != null) {
                  if (controller != null) {
                    changeLanguage(mode, controller);
                  } else {
                    languageNotifier.setLanguage(mode);
                  }
                }
              },
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: Text(AppStrings.getSettingsLanguage(context)),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: CustomSearchBar(
                hintText: AppStrings.getSearchLanguage(context),
                suggestionsBuilder: (context, controller) async {
                  final query = controller.text;
                  _filterLanguages(query);

                  return _filteredLanguages.map((language) {
                    return InkWell(
                      onTap: () => changeLanguage(language, controller),
                      child: buildLanguageItem(language, controller),
                    );
                  }).toList();
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final language = _filteredLanguages[index];
                final isLast = index == _filteredLanguages.length - 1;

                return Column(
                  children: [
                    InkWell(
                      onTap: () => languageNotifier.setLanguage(language),
                      child: buildLanguageItem(language, null),
                    ),
                    if (!isLast) const Divider(indent: 16, endIndent: 16),
                  ],
                );
              },
              childCount: _filteredLanguages.length,
            ),
          ),
        ],
      ),
    );
  }
}
