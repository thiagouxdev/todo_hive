import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo_hive/core/routes/app_routes.dart';
import 'package:todo_hive/core/services/preferences_service.dart';

import '../../../core/utils/constants/app_image_strings.dart';
import '../../../core/utils/constants/app_strings.dart';
import '../../../core/utils/helpers/app_helper_functions.dart'; // Importe o PreferencesService

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create scale animation
    _scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticOut,
      ),
    );

    // Create opacity animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
      ),
    );

    // Start animation
    _controller.forward();

    // Verifica se o usuário já viu a tela de Welcome
    _checkIfUserHasSeenWelcome();
  }

  Future<void> _checkIfUserHasSeenWelcome() async {
    final hasSeenWelcome =
        await PreferencesService.hasSeenWelcome(); // Método correto

    // Navega para a tela correta após o delay
    Timer(const Duration(seconds: 3), () {
      if (hasSeenWelcome) {
        Navigator.pushReplacementNamed(context, AppRoutes.home);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.welcome);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated logo
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Opacity(
                    opacity: _opacityAnimation.value,
                    child: AppImages.load(
                      AppHelperFunctions.isDarkMode(context)
                          ? AppImages.appLogoDark
                          : AppImages.appLogoLight,
                      width: 156,
                      height: 156,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 32),
            // App name
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Text(
                    AppStrings.appName,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
