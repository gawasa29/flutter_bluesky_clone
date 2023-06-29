import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/router/scaffold_with_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});
  static const routePath = '/Home';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build HomeScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    final scrollController = ScrollController();
    var lastScrollOffset = 0.0;
    scrollController.addListener(() {
      if (scrollController.offset > lastScrollOffset) {
        ref.watch(isVisibleProvider.notifier).update((state) => false);
      } else if (scrollController.offset < lastScrollOffset) {
        ref.watch(isVisibleProvider.notifier).update((state) => true);
      }
      lastScrollOffset = scrollController.offset;
    });
    return Scaffold(
      drawer: const CustomDrawer(),
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverAppBar(
            expandedHeight: 80,
            floating: true,
            snap: true,
            title: Text(
              'Bluesky',
              style: typography.titleLarge!.copyWith(
                color: colors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
            ],
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5),
                child: DefaultTabController(
                  length: 3,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        tabs: [
                          Text(
                            'Following',
                            style: typography.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Bluesky Team',
                            style: typography.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "What's Hot",
                            style: typography.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 1,
                        color: colors.secondary,
                      ),
                    ],
                  ),
                )),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ComposePostScreen.routePath);
        },
        child: const Icon(Icons.edit_square),
      ),
    );
  }
}

class EachPost extends StatelessWidget {
  const EachPost({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            const CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const UserInfo(),
                      Expanded(child: Container()),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: typography.bodySmall!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Posts will appear here.',
                    style: typography.bodyLarge!.copyWith(),
                  ),
                  const ActionIcons(),
                ],
              ),
            ),
          ],
        ),
        const Divider(thickness: 0.5),
      ],
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final typography = theme.textTheme;
    final colors = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UserName',
          style: typography.titleMedium!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@HandleName',
          style: typography.bodySmall!.copyWith(
            color: colors.onSecondary,
          ),
        ),
      ],
    );
  }
}

class ActionIcons extends StatelessWidget {
  const ActionIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            print('Tap Reply');
          },
          child: const Row(
            children: [
              Icon(Icons.chat_bubble_outline),
              Text('0'),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Retweet');
          },
          child: const Row(
            children: [
              Icon(Icons.repeat),
              Text('0'),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            print('Tap Like');
          },
          child: const Row(
            children: [
              Icon(Icons.favorite_border),
              Text('0'),
            ],
          ),
        ),
        PopupMenuButton<int>(
          icon: const Icon(Icons.more_horiz),
          position: PopupMenuPosition.under,
          onSelected: print,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.g_translate),
                    SizedBox(width: 5),
                    Text('Translate...'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.copy_rounded),
                    SizedBox(width: 5),
                    Text('Copy post text'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.reply),
                    SizedBox(width: 5),
                    Text('Share...'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 3,
                child: Row(
                  children: [
                    Icon(Icons.speaker_notes_off),
                    SizedBox(width: 5),
                    Text('Mute thread'),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem(
                value: 4,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(width: 5),
                    Text('Delete post'),
                  ],
                ),
              ),
            ];
          },
        ),
      ],
    );
  }
}
