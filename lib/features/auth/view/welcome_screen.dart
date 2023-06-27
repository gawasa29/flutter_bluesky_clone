import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/auth/view/hosting_sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_in_screen.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const routePath = '/Welcome';
  @override
  Widget build(BuildContext context) {
    print('📱 build WelcomeScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 60),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Container()),
              Text(
                'Bluesky',
                style: typography.displayLarge!.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "See what's next",
                style: typography.displaySmall!.copyWith(
                  color: colors.onSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Expanded(child: Container()),
              ElevatedButton(
                onPressed: () {
                  context.go(HostingSignUpScreen.routeFullPath);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: colors.primary),
                child: Text(
                  'Create a new account',
                  style: typography.titleLarge!.copyWith(
                    color: colors.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.go(SignInScreen.routeFullPath);
                },
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 60),
                    backgroundColor: colors.secondary),
                child: Text(
                  'Sign In',
                  style: typography.titleLarge!.copyWith(
                    color: colors.onSecondary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
