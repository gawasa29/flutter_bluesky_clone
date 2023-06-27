import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HandleNameEntryScreen extends ConsumerStatefulWidget {
  const HandleNameEntryScreen({super.key});
  static const routePath = 'HandleNameEntry';
  static const routeFullPath = '/Welcome/HostingSignUp/SignUp/HandleNameEntry';
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HandleNameEntryScreenState();
}

class _HandleNameEntryScreenState extends ConsumerState<HandleNameEntryScreen> {
  final handleNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    print('📱 HandleNameEntryScreen !!! ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
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
                    'Last step!',
                    style: typography.titleMedium!.copyWith(
                      color: colors.onSecondary,
                    ),
                  ),
                  Text(
                    'Your user handle',
                    style: typography.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: handleNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.alternate_email),
                      hintText: 'e.g alice',
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'your full handle will be @${handleNameController.text}.bsky.social',
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
                        onPressed: () {},
                        child: const Text('Next'),
                      ),
                    ],
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
