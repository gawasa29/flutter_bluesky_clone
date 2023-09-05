import 'package:bluesky/bluesky.dart' as bsky;
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:flutter_bluesky_clone/common/error/error.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/common/widgets/error_banner.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:flutter_bluesky_clone/features/auth/view/welcome_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/router/router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_form_screen.g.dart';

@riverpod
class Auth extends _$Auth {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required String service,
    required String id,
    required String password,
  }) async {
    try {
      state = const AsyncLoading();

      final authRepository = ref.watch(authRepositoryProvider);

      await authRepository.createSession(
        service: service,
        id: id,
        password: password,
      );

      await authRepository.setService(service);
      await authRepository.setId(id);
      await authRepository.setPassword(password);

      // To update the session
      await BlueSkyApp.initializeApp();

      state = const AsyncData(null);

      if (state.hasError == false) {
        ref.read(routerProvider).go(HomeScreen.routePath);
      }
    } on bsky.UnauthorizedException catch (e, stackTrace) {
      final errorMessage = parseError(e);

      if (errorMessage == null) return;

      state = AsyncError(errorMessage, stackTrace);
    } on bsky.XRPCException catch (e, stackTrace) {
      final errorMessage = parseError(e);

      if (errorMessage == null) return;

      state = AsyncError(errorMessage, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    ref.read(authRepositoryProvider)
      ..removeService()
      ..removeId()
      ..removePassword();

    await BlueSkyApp.initializeApp();
    state = const AsyncData(null);

    if (state.hasError == false) {
      ref.read(routerProvider).go(WelcomeScreen.routePath);
    }
  }
}

class SignInFormScreen extends ConsumerStatefulWidget {
  const SignInFormScreen({super.key});
  static const routePath = 'SignInForm';
  static const routeFullPath = '/Welcome/SignIn/SignInForm';

  @override
  ConsumerState<SignInFormScreen> createState() => _SignInFormScreenState();
}

class _SignInFormScreenState extends ConsumerState<SignInFormScreen> {
  static const _defaultService = 'bsky.social';

  final _serviceController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _serviceController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build SignInFormScreen ');
    final theme = Theme.of(context);
    final typography = theme.textTheme;

    final session = ref.watch(authProvider);

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
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'Username or email address',
                    ),
                  ),
                  TextFormField(
                    controller: _passwordController,
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
                      final sessionSignIn = ref.read(authProvider.notifier);
                      var service = _serviceController.text.trim();
                      var id = _usernameController.text.trim();
                      final password = _passwordController.text.trim();

                      if (service.isEmpty) {
                        // Force "bsky.social" if the service is not entered
                        service = _serviceController.text = _defaultService;
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
