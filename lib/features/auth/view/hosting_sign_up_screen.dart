import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/auth/view/sign_up_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum HostingOption { bluesky, other }

final hostingSelectionStateProvider =
    StateProvider((ref) => HostingOption.bluesky);

final showErrorContainerProvider = StateProvider<bool>((ref) => false);
final urlProvider = StateProvider<String>((ref) => 'https://');

class HostingSignUpScreen extends ConsumerWidget {
  const HostingSignUpScreen({super.key});
  static const routePath = 'HostingSignUp';
  static const routeFullPath = '/Welcome/HostingSignUp';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build HostingSignUpScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final hostingSelectionProvider = ref.watch(hostingSelectionStateProvider);
    final url = ref.watch(urlProvider);
    final urlController = TextEditingController(text: url);
    final showErrorContainer = ref.watch(showErrorContainerProvider);
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
                      groupValue: hostingSelectionProvider,
                      onChanged: (value) {
                        ref
                            .watch(hostingSelectionStateProvider.notifier)
                            .state = value!;
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
                          groupValue: hostingSelectionProvider,
                          onChanged: (value) {
                            ref
                                .watch(hostingSelectionStateProvider.notifier)
                                .state = value!;
                          },
                        ),
                        if (hostingSelectionProvider == HostingOption.other)
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Column(
                              children: [
                                const Text(
                                    'Enter the address of your provider:'),
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
                                        ref
                                            .read(showErrorContainerProvider
                                                .notifier)
                                            .state = false;
                                        ref.read(urlProvider.notifier).state =
                                            'https://staging.bsky.dev';
                                      },
                                      child: const Text('Staging'),
                                    ),
                                    const SizedBox(width: 5),
                                    ElevatedButton(
                                      onPressed: () {
                                        ref
                                            .read(showErrorContainerProvider
                                                .notifier)
                                            .state = true;
                                        ref.read(urlProvider.notifier).state =
                                            'http://localhost:2583';
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colors.error,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.report_gmailerrorred),
                          ),
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Text(
                                'Unable to contact your service. Please check your Internet connection.',
                                style: typography.bodyMedium!.copyWith(
                                  color: colors.background,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
                          context.go(SignUpScreen.routeFullPath);
                        },
                        child: const Text('Next'),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
