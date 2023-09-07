import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/util/calculate_height.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/widgets/each_post.dart';
import 'package:flutter_bluesky_clone/features/user/repository/user_repository.dart';
import 'package:flutter_bluesky_clone/features/user/view/edit_profile_screen.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/background_pic.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routePath = '/Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build ProfileScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    final profile = ref.watch(fetchProfileProvider);

    return CustomScaffold(
      body: SafeArea(
        child: profile.when(
          error: (error, stackTrace) => Text('Error $error'),
          loading: () => const Center(child: CircularProgressIndicator()),
          data: (profile) {
            return DefaultTabController(
              length: 2,
              child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: calculateExpandedHeight(
                        context: context,
                        bioText: profile.description ?? '',
                        textStyle: typography.bodyLarge!,
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                BackgroundPic(banner: profile.banner),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        context.go(
                                          EditProfileScreen.routeFullPath,
                                        );
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
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Column(
                                    children: [
                                      ProfileUserInfo(
                                        handle: profile.handle,
                                        displayName: profile.displayName,
                                      ),
                                      FollowInfo(
                                        followersCount: profile.followersCount,
                                        followsCount: profile.followsCount,
                                        postsCount: profile.postsCount,
                                      ),
                                      Text(
                                        profile.description ?? '',
                                        maxLines: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 110, left: 10),
                              child: UserPic(
                                radius: 40,
                                avatar: profile.avatar,
                              ),
                            ),
                          ],
                        ),
                      ),
                      bottom: const PreferredSize(
                        preferredSize: Size.fromHeight(5),
                        child: ProfileTabBar(),
                      ),
                    ),
                  ];
                },
                body: ListView.builder(
                  itemBuilder: (context, index) {
                    final feed = ref.watch(fetchUserFeedsProvider);

                    return feed.when(
                      error: (error, stackTrace) => Text('Error $error'),
                      loading: () =>
                          const Center(child: CircularProgressIndicator()),
                      data: (feeds) {
                        if (index >= feeds.length) return null;

                        print('feeds: ${feeds.length}');

                        final feed = feeds[index];

                        final post = feed.post;
                        final reason = feed.reason;

                        final recode = post.record;
                        final author = post.author;

                        return EachPost(
                          reason: reason,
                          replyCount: post.replyCount,
                          repostCount: post.repostCount,
                          likeCount: post.likeCount,
                          text: recode.text,
                          createdAt: recode.createdAt,
                          handle: author.handle,
                          displayName: author.displayName,
                          avatar: author.avatar,
                        );
                      },
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ComposePostScreen.routePath);
        },
        shape: const CircleBorder(),
        backgroundColor: colors.primary,
        child: Icon(
          Iconsax.message_edit,
          color: colors.onPrimary,
        ),
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
  const ProfileUserInfo({
    required this.handle,
    required this.displayName,
    super.key,
  });

  final String handle;
  final String? displayName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          displayName ?? handle,
          style: typography.headlineLarge!.copyWith(
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          handle,
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
          ),
        ),
      ],
    );
  }
}

class FollowInfo extends StatelessWidget {
  const FollowInfo({
    required this.followersCount,
    required this.followsCount,
    required this.postsCount,
    super.key,
  });

  final int followersCount;
  final int followsCount;
  final int postsCount;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;

    return Row(
      children: [
        Text(
          followersCount.toString(),
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 1),
        Text(
          'followers',
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          followsCount.toString(),
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 1),
        Text(
          'following',
          style: typography.titleMedium!.copyWith(
            color: colors.onSecondary,
          ),
        ),
        const SizedBox(width: 5),
        Text(
          postsCount.toString(),
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
    );
  }
}

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
