import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/user/view/moderation_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/settings_screen.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 300,
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const UserPic(radius: 40),
                  const SizedBox(height: 5),
                  Text(
                    'GAWASA',
                    style: typography.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@gawasa.bsky.social',
                    style: typography.titleMedium!.copyWith(
                      color: colors.onSecondary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Text(
                        '0',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'follower',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                      Text(
                        '・',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                      Text(
                        '0',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'follower',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.confirmation_number),
                      Text(
                        '0 invite codes',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.search),
            title: const Text('Search'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.home),
            title: const Text('Home'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
          ),
          ListTile(
            onTap: () {
              context.push(ModerationScreen.routePath);
            },
            leading: const Icon(Icons.back_hand),
            title: const Text('Moderation'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {
              context.push(SettingsScreen.routePath);
            },
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.chat_bubble_outline),
            label: const Text('Feedback'),
          ),
        ],
      ),
    );
  }
}
