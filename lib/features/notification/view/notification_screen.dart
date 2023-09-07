import 'package:flutter/material.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_drawer.dart';
import 'package:flutter_bluesky_clone/common/widgets/custom_scaffold.dart';
import 'package:flutter_bluesky_clone/features/notification/repository/notification_repository.dart';
import 'package:flutter_bluesky_clone/features/notification/view/widgets/each_notification.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});
  static const routePath = '/Notification';
  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: ListView.builder(
        itemBuilder: (context, index) {
          final notification = ref.watch(fetchNotificationsProvider);

          return notification.when(
            error: (error, stackTrace) => Text('Error $error'),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (notifications) {
              if (index >= notifications.length) return null;

              print('notifications: ${notifications.length}');

              final notification = notifications[index];

              final author = notification.author;
              final reason = notification.reason;
              final indexedAt = notification.indexedAt;

              return EachNotification(
                author: author,
                reason: reason,
                indexedAt: indexedAt,
              );
            },
          );
        },
      ),
    );
  }
}
