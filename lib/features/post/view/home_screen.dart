import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/post/repository/post_repository.dart';
import 'package:flutter_bluesky_clone/features/post/view/compose_post_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/widgets/each_post.dart';
import 'package:flutter_bluesky_clone/router/scaffold_with_bottom_nav_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return CustomScaffold(
      drawer: const CustomDrawer(),
      body: SafeArea(
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
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
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.gear,
                      size: 18,
                    ),
                  ),
                ],
                bottom: const PreferredSize(
                  preferredSize: Size.fromHeight(5),
                  child: HomeTabBar(),
                ),
              ),
            ];
          },
          body: ListView.builder(
            itemBuilder: (context, index) {
              final feed = ref.watch(fetchFeedsProvider);

              return feed.when(
                error: (error, stackTrace) => Text('Error $error'),
                loading: () => const Center(child: CircularProgressIndicator()),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.push(ComposePostScreen.routePath);
        },
        shape: const CircleBorder(),
        backgroundColor: colors.primary,
        child: Icon(
          FontAwesomeIcons.penToSquare,
          color: colors.onPrimary,
        ),
      ),
    );
  }
}

class HomeTabBar extends StatelessWidget {
  const HomeTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return DefaultTabController(
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
    );
  }
}
