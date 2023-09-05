import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/common/widgets/error_banner.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_up_screen.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:go_router/go_router.dart';

enum HostingOption { bluesky, other }

class HostingSignUpScreen extends StatefulWidget {
  const HostingSignUpScreen({super.key});
  static const routePath = 'HostingSignUp';
  static const routeFullPath = '/Welcome/HostingSignUp';
  @override
  State<HostingSignUpScreen> createState() => _HostingSignUpScreenState();
}

class _HostingSignUpScreenState extends State<HostingSignUpScreen> {
  HostingOption hostingSelection = HostingOption.bluesky;
  final urlController = TextEditingController(text: 'https://');
  bool showErrorContainer = false;

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build HostingSignUpScreen ');
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
                    'Step 1 of 3',
                    style: typography.titleMedium!.copyWith(
                      color: colors.onSecondary,
                    ),
                  ),
                  Text(
                    'Your hosting provider',
                    style: typography.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text('This is the service that keeps you online.'),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.onSecondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: RadioListTile(
                      title: const Text('Bluesky (default)'),
                      value: HostingOption.bluesky,
                      groupValue: hostingSelection,
                      onChanged: (value) {
                        hostingSelection = value!;
                        setState(() {});
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: colors.onSecondary),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RadioListTile(
                          title: const Text('Other'),
                          value: HostingOption.other,
                          groupValue: hostingSelection,
                          onChanged: (value) {
                            hostingSelection = value!;
                            setState(() {});
                          },
                        ),
                        if (hostingSelection == HostingOption.other)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                const Text(
                                  'Enter the address of your provider:',
                                ),
                                TextFormField(
                                  controller: urlController,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.language),
                                  ),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        showErrorContainer = false;
                                        urlController.text =
                                            'https://staging.bsky.dev';
                                        setState(() {});
                                      },
                                      child: const Text('Staging'),
                                    ),
                                    const SizedBox(width: 5),
                                    ElevatedButton(
                                      onPressed: () {
                                        showErrorContainer = true;
                                        urlController.text =
                                            'http://localhost:2583';
                                        setState(() {});
                                      },
                                      child: const Text('Dev Server'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  if (showErrorContainer)
                    const ErrorBanner(
                      error:
                          'Unable to contact your service. Please check your Internet connection.',
                    )
                  else
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors.secondary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.report_gmailerrorred),
                          ),
                          Flexible(
                            child: Padding(
                              padding: EdgeInsets.all(8),
                              child: Text(
                                'You can change hosting providers at any time.',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  CustomNavigationButton(
                    onPressed: () {
                      context.go(SignUpScreen.routeFullPath);
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
