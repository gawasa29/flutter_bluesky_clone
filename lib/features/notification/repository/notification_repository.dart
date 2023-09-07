import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/blue_sky_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

class NotificationRepository {
  NotificationRepository(this._bluesky);
  final Bluesky _bluesky;

  Future<Notifications> getNotifications() async {
    final response = await _bluesky.notifications.findNotifications();
    return response.data;
  }
}

@riverpod
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepository(BlueSkyApp.instance);
}

@riverpod
Future<List<Notification>> fetchNotifications(FetchNotificationsRef ref) async {
  final notifications =
      await ref.watch(notificationRepositoryProvider).getNotifications();

  final notificationList = notifications.notifications;

  return notificationList;
}
