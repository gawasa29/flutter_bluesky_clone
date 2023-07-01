import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/widgets/each_post.dart';
import 'package:flutter_bluesky_clone/features/user/view/edit_profile_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/background_pic.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routePath = '/Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build ProfileScreen ');
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    return CustomScaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: 360,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const BackgroundPic(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.go(EditProfileScreen.routeFullPath);
                                  },
                                  child: Text(
                                    'Edit Profile',
                                    style: typography.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                const ProfilePopUpMenuButton(),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: ProfileUserInfo(),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 110, left: 10),
                          child: UserPic(radius: 40),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              bottom: const PreferredSize(
                preferredSize: Size.fromHeight(5),
                child: ProfileTabBar(),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return const EachPost();
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ComposePostScreen.routePath);
        },
        child: const Icon(Icons.edit_square),
      ),
    );
  }
}

class ProfilePopUpMenuButton extends StatelessWidget {
  const ProfilePopUpMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    return PopupMenuButton<int>(
      icon: const Icon(Icons.more_horiz),
      position: PopupMenuPosition.under,
      onSelected: print,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      itemBuilder: (context) {
        return [
          PopupMenuItem(
            value: 0,
            child: Text(
              'Share',
              style: typography.titleMedium!.copyWith(),
            ),
          ),
          PopupMenuItem(
            value: 1,
            child: Text(
              'Add to Lists',
              style: typography.titleMedium!.copyWith(),
            ),
          ),
        ];
      },
    );
  }
}

class ProfileUserInfo extends StatelessWidget {
  const ProfileUserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'GAWASA',
          style: typography.headlineLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@gawasa.bsky.social',
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
          ),
        ),
        Row(
          children: [
            Text(
              '0',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 1),
            Text(
              'follower',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '0',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 1),
            Text(
              'follower',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
              ),
            ),
            const SizedBox(width: 5),
            Text(
              '0',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 1),
            Text(
              'posts',
              style: typography.titleMedium!.copyWith(
                color: colors.onSecondary,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
            tabs: [
              Text(
                'Posts',
              ),
              Text(
                'Posts & replies',
              ),
            ],
          ),
          Container(height: 1),
        ],
      ),
    );
  }
}
