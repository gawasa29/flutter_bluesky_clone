import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_in_form_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const routePath = 'SignIn';
  static const routeFullPath = '/Welcome/SignIn';
  @override
  Widget build(BuildContext context) {
    print('📱 build SignInScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return CustomScaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Text(
          'Sign in as...',
          style: typography.titleMedium!.copyWith(),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(5),
          child: Container(
            height: 1,
            color: colors.secondary,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: colors.secondary),
            ),
            child: ListTile(
              onTap: () {
                context.go(SignInFormScreen.routeFullPath);
              },
              title: const Text('Other account'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
          CustomNavigationButton(
            onPressed: () {
              context.go(HomeScreen.routePath);
            },
          ),
        ],
      ),
    );
  }
}
