import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomSearchBar extends ConsumerStatefulWidget {
  final String hintText;
  final Widget? leading;
  final Future<List<Widget>> Function(BuildContext, SearchController)
      suggestionsBuilder;
  final bool showLeadingIcon;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.suggestionsBuilder,
    this.leading,
    this.showLeadingIcon = true,
  });

  @override
  ConsumerState<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends ConsumerState<CustomSearchBar> {
  final searchController = SearchController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _clearAndClose() {
    searchController.clear();
    searchController.closeView(null);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
      barElevation: const WidgetStatePropertyAll(0),
      searchController: searchController,
      barHintText: widget.hintText,
      viewHintText: widget.hintText,
      barLeading: widget.showLeadingIcon ? const Icon(Icons.search) : null,
      viewLeading: BackButton(
        onPressed: _clearAndClose,
      ),
      isFullScreen: true,
      suggestionsBuilder: widget.suggestionsBuilder,
    );
  }
}
