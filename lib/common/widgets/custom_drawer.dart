import 'package:flutter/material.dart';

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
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
                  ),
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
            onTap: () {},
            leading: const Icon(Icons.back_hand),
            title: const Text('Moderation'),
          ),
          ListTile(
            onTap: () {},
            leading: const Icon(Icons.account_circle),
            title: const Text('Profile'),
          ),
          ListTile(
            onTap: () {},
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
