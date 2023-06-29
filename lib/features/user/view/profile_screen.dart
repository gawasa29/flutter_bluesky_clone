import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});
  static const routePath = '/Profile';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('📱 build ProfileScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Scaffold(
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
                            const SizedBox(
                              width: double.infinity,
                              height: 150,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      'https://htmlcolorcodes.com/assets/images/colors/bright-blue-color-solid-background-1920x1080.png',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Edit Profile',
                                    style: typography.bodySmall!.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                PopupMenuButton<int>(
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
                                          style: typography.titleMedium!
                                              .copyWith(),
                                        ),
                                      ),
                                      PopupMenuItem(
                                        value: 1,
                                        child: Text(
                                          'Add to Lists',
                                          style: typography.titleMedium!
                                              .copyWith(),
                                        ),
                                      ),
                                    ];
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
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
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 110, left: 10),
                          child: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(5),
                child: DefaultTabController(
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
                ),
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
    );
  }
}
