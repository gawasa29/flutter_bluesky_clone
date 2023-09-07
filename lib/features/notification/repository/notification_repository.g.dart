// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationRepositoryHash() =>
    r'1a66fdf759d18f3f15f4c35415fced6638a6e748';

/// See also [notificationRepository].
@ProviderFor(notificationRepository)
final notificationRepositoryProvider =
    AutoDisposeProvider<NotificationRepository>.internal(
  notificationRepository,
  name: r'notificationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotificationRepositoryRef
    = AutoDisposeProviderRef<NotificationRepository>;
String _$fetchNotificationsHash() =>
    r'9844a9bc34b1be3a1f5d4eea54073beb66b92a88';

/// See also [fetchNotifications].
@ProviderFor(fetchNotifications)
final fetchNotificationsProvider =
    AutoDisposeFutureProvider<List<Notification>>.internal(
  fetchNotifications,
  name: r'fetchNotificationsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchNotificationsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchNotificationsRef
    = AutoDisposeFutureProviderRef<List<Notification>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
