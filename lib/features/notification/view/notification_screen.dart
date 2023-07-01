import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_info.dart';
import 'package:flutter_bluesky_clone/features/user/view/widgets/user_pic.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  static const routePath = '/Notification';
  @override
  Widget build(BuildContext context) {
    print('📱 build NotificationScreen ');
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return CustomScaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: Text(
          'Notification',
          style: typography.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Container(
            height: 1,
            color: colors.secondary,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => const EachNotification(),
        itemCount: 10,
        separatorBuilder: (context, _) {
          return const Divider(thickness: 0.5);
        },
      ),
    );
  }
}

class EachNotification extends StatelessWidget {
  const EachNotification({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final typography = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          const Icon(
            Icons.favorite_border,
            color: Colors.pink,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const UserPic(radius: 20),
                        Row(
                          children: [
                            const UserInfo(),
                            const SizedBox(width: 5),
                            Text(
                              'liked your post',
                              style: typography.titleMedium!.copyWith(
                                color: colors.onSecondary,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              '3d',
                              style: typography.titleMedium!.copyWith(
                                color: colors.onSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'Description will appear here.',
                  style: typography.bodyLarge!.copyWith(
                    color: colors.onSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
