import 'package:flutter/material.dart';

/// A reusable loading page that can be used across the app.
/// It displays a centered loading indicator.
class LoadingPage extends StatelessWidget {
  final Color? backgroundColor;
  final Color? indicatorColor;
  final String? message;

  const LoadingPage({
    super.key,
    this.backgroundColor,
    this.indicatorColor,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                indicatorColor ?? Theme.of(context).colorScheme.primary,
              ),
            ),
            if (message != null)
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  message!,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
