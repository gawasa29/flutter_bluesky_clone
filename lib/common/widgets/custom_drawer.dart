import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/notification/view/notification_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/features/search/view/search_screen.dart';
import 'package:flutter_bluesky_clone/features/user/repository/user_repository.dart';
import 'package:flutter_bluesky_clone/features/user/view/moderation_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/profile_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/settings_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    final profile = ref.watch(fetchProfileProvider);

    return Drawer(
      child: profile.when(
        error: (error, stackTrace) => Text('Error $error'),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (profile) {
          return Column(
            children: [
              SizedBox(
                height: 300,
                child: DrawerHeader(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserPic(
                        radius: 40,
                        avatar: profile.avatar,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        profile.displayName ?? profile.handle,
                        style: typography.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '@${profile.handle}',
                        style: typography.titleMedium!.copyWith(
                          color: colors.onSecondary,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Text(
                            profile.followersCount.toString(),
                            style: typography.titleMedium!.copyWith(
                              color: colors.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' followers',
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
                            profile.followsCount.toString(),
                            style: typography.titleMedium!.copyWith(
                              color: colors.onSecondary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' following',
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
              Expanded(
                child: ListView(
                  children: [
                    ListTile(
                      onTap: () {
                        context.go(SearchScreen.routePath);
                      },
                      leading: const Icon(Iconsax.search_normal),
                      title: const Text('Search'),
                    ),
                    ListTile(
                      onTap: () {
                        context.go(HomeScreen.routePath);
                      },
                      leading: const Icon(Iconsax.home_2),
                      title: const Text('Home'),
                    ),
                    ListTile(
                      onTap: () {
                        context.go(NotificationScreen.routePath);
                      },
                      leading: const Icon(Iconsax.notification),
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
                      onTap: () {
                        context.go(ProfileScreen.routePath);
                      },
                      leading: const Icon(Iconsax.profile_circle),
                      title: const Text('Profile'),
                    ),
                    ListTile(
                      onTap: () {
                        context.push(SettingsScreen.routePath);
                      },
                      leading: const Icon(Iconsax.setting_2),
                      title: const Text('Settings'),
                    ),
                  ],
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat_bubble_outline),
                label: const Text('Feedback'),
              ),
            ],
          );
        },
      ),
    );
  }
}
