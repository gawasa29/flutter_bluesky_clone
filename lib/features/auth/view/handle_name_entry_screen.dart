import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/auth/view/widgets/custom_navigation_button.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class HandleNameEntryScreen extends StatefulWidget {
  const HandleNameEntryScreen({super.key});
  static const routePath = 'HandleNameEntry';
  static const routeFullPath = '/Welcome/HostingSignUp/SignUp/HandleNameEntry';
  @override
  State<HandleNameEntryScreen> createState() => _HandleNameEntryScreenState();
}

class _HandleNameEntryScreenState extends State<HandleNameEntryScreen> {
  final handleNameController = TextEditingController();

  @override
  void dispose() {
    handleNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('📱 build HandleNameEntryScreen ');
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
                      prefixIcon: Icon(
                        FontAwesomeIcons.at,
                        size: 18,
                      ),
                      hintText: 'e.g alice',
                    ),
                    onChanged: (value) => setState(() {}),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'your full handle will be @${handleNameController.text}.bsky.social',
                  ),
                  CustomNavigationButton(
                    onPressed: () {
                      context.go(HomeScreen.routePath);
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
