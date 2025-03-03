import 'package:flutter/material.dart';
import 'package:todo_hive/core/utils/constants/app_strings.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onActionPressed;
  final bool showAction;

  const SectionHeader({
    super.key,
    required this.title,
    this.onActionPressed,
    this.showAction = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      trailing: showAction
          ? TextButton(
              onPressed: onActionPressed,
              child: Text(
                AppStrings.getSeeMore(context),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            )
          : null,
    );
  }
}
