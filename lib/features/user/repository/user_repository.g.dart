// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userRepositoryHash() => r'710e3907b3061de576585ea00dd62f2f741a2bc1';

/// See also [userRepository].
@ProviderFor(userRepository)
final userRepositoryProvider = AutoDisposeProvider<UserRepository>.internal(
  userRepository,
  name: r'userRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserRepositoryRef = AutoDisposeProviderRef<UserRepository>;
String _$fetchProfileHash() => r'b23f54b232185bb003ab55be7cc0ffabf7bed713';

/// See also [fetchProfile].
@ProviderFor(fetchProfile)
final fetchProfileProvider = AutoDisposeFutureProvider<ActorProfile>.internal(
  fetchProfile,
  name: r'fetchProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProfileRef = AutoDisposeFutureProviderRef<ActorProfile>;
String _$fetchUserFeedsHash() => r'789216999f838dc4f9d1cf4bec5bd85c2872ea75';

/// See also [fetchUserFeeds].
@ProviderFor(fetchUserFeeds)
final fetchUserFeedsProvider =
    AutoDisposeFutureProvider<List<FeedView>>.internal(
  fetchUserFeeds,
  name: r'fetchUserFeedsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchUserFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchUserFeedsRef = AutoDisposeFutureProviderRef<List<FeedView>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
