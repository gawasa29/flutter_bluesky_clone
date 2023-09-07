import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/common/widgets/error_banner.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInFormScreen extends ConsumerStatefulWidget {
  const SignInFormScreen({super.key});
  static const routePath = 'SignInForm';
  static const routeFullPath = '/Welcome/SignIn/SignInForm';

  @override
  ConsumerState<SignInFormScreen> createState() => _SignInFormScreenState();
}

class _SignInFormScreenState extends ConsumerState<SignInFormScreen> {
  static const defaultService = 'bsky.social';

  final serviceController = TextEditingController();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    serviceController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build SignInFormScreen ');
    final theme = Theme.of(context);
    final typography = theme.textTheme;

    final session = ref.watch(authCommandProvider);

    return CustomScaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign into',
                    style: typography.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: AbsorbPointer(
                      child: TextFormField(
                        readOnly: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.language),
                          hintText: 'BlueSky Social',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Account',
                    style: typography.bodyMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextFormField(
                    controller: usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'Username or email address',
                    ),
                  ),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(height: 10),
                  session.when(
                    error: (error, stackTrace) =>
                        ErrorBanner(error: error.toString()),
                    loading: () => const SizedBox(),
                    data: (_) => const SizedBox(),
                  ),
                  CustomNavigationButton(
                    onPressed: () async {
                      final sessionSignIn =
                          ref.read(authCommandProvider.notifier);
                      var service = serviceController.text.trim();
                      var id = usernameController.text.trim();
                      final password = passwordController.text.trim();

                      if (service.isEmpty) {
                        // Force "bsky.social" if the service is not entered
                        service = serviceController.text = defaultService;
                      }

                      if (!id.contains('.')) {
                        // Make the domain input optional.
                        id += '.$service';
                      }

                      await sessionSignIn.signIn(
                        service: service,
                        id: id,
                        password: password,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
