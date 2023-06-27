import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/auth/view/handle_name_entry_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final inviteControllerProvider = ChangeNotifierProvider<TextEditingController>(
  (ref) => TextEditingController(),
);

class SignUpScreen extends ConsumerWidget {
  const SignUpScreen({super.key});
  static const routePath = 'SignUp';
  static const routeFullPath = '/Welcome/HostingSignUp/SignUp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 SignUpScreen !!! ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final inviteController = ref.watch(inviteControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Step 2 of 3',
                    style: typography.titleMedium!.copyWith(
                      color: colors.onSecondary,
                    ),
                  ),
                  Text(
                    'Your account',
                    style: typography.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('Invite code'),
                  TextFormField(
                    controller: inviteController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.confirmation_number),
                      hintText: 'Required for this provider',
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (inviteController.text.isEmpty)
                    Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(text: "Don't have an invite code?"),
                          TextSpan(
                            text: 'Join the waitlist ',
                            style: const TextStyle(color: Colors.blueAccent),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                          const TextSpan(
                            text:
                                "to try the beta before it's publicly available.",
                          ),
                        ],
                        style: typography.bodyMedium!.copyWith(),
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Email address'),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.mail),
                            hintText: 'Enter your email address',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Password'),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            hintText: 'Choose your password',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Your birth date'),
                        SizedBox(
                          height: 200,
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            mode: CupertinoDatePickerMode.date,
                            onDateTimeChanged: (DateTime newDate) {},
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              const TextSpan(
                                  text:
                                      'By creating an account you agree to the '),
                              TextSpan(
                                text: 'Terms of Service',
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                              const TextSpan(
                                text: ' and ',
                              ),
                              TextSpan(
                                text: 'Privacy Policy.',
                                style:
                                    const TextStyle(color: Colors.blueAccent),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {},
                              ),
                            ],
                            style: typography.bodyMedium!.copyWith(),
                          ),
                        )
                      ],
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
                          context.go(HandleNameEntryScreen.routeFullPath);
                        },
                        child: const Text('Next'),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
