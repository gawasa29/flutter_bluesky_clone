import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/auth/view/handle_name_entry_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const routePath = 'SignUp';
  static const routeFullPath = '/Welcome/HostingSignUp/SignUp';
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final inviteController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    inviteController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build SignUpScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

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
                      prefixIcon: Icon(
                        FontAwesomeIcons.ticket,
                        size: 18,
                      ),
                      hintText: 'Required for this provider',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
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
                            prefixIcon: Icon(
                              FontAwesomeIcons.envelope,
                              size: 18,
                            ),
                            hintText: 'Enter your email address',
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Text('Password'),
                        TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              FontAwesomeIcons.lock,
                              size: 18,
                            ),
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
                                    'By creating an account you agree to the ',
                              ),
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
                        ),
                      ],
                    ),
                  CustomNavigationButton(
                    onPressed: () {
                      context.go(HandleNameEntryScreen.routeFullPath);
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
