import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';

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
        body: Column(
          children: [
            Padding(
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
                                const CircleAvatar(
                                  radius: 20,
                                  backgroundImage: NetworkImage(
                                      'https://images.unsplash.com/photo-1491349174775-aaafddd81942?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80'),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'UserName',
                                      style: typography.titleMedium!.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
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
            ),
            const Divider(thickness: 0.5),
          ],
        ));
  }
}
