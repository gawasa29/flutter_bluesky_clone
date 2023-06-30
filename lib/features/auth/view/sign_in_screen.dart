import 'package:flutter/material.dart';
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
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Scaffold(
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
                )),
          ),
          body: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: colors.secondary),
                ),
                child: ListTile(
                  onTap: () {},
                  title: const Text('Other account'),
                  trailing: const Icon(Icons.chevron_right),
                ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: const Text('Back'),
                  ),
                  Expanded(child: Container()),
                  TextButton(
                    onPressed: () {
                      context.go(HomeScreen.routePath);
                    },
                    child: const Text('Next'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
