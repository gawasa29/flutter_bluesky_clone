// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$postRepositoryHash() => r'814cd05000adeb6fa62f92c2939f82b7de30054f';

/// See also [postRepository].
@ProviderFor(postRepository)
final postRepositoryProvider = AutoDisposeProvider<PostRepository>.internal(
  postRepository,
  name: r'postRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$postRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PostRepositoryRef = AutoDisposeProviderRef<PostRepository>;
String _$fetchFeedsHash() => r'c3619334a197315a0da78558b8dcdaa641b8b3de';

/// See also [fetchFeeds].
@ProviderFor(fetchFeeds)
final fetchFeedsProvider = AutoDisposeFutureProvider<List<FeedView>>.internal(
  fetchFeeds,
  name: r'fetchFeedsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchFeedsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchFeedsRef = AutoDisposeFutureProviderRef<List<FeedView>>;
String _$fetchPostHash() => r'a5f46b38eb323235f9881b638ca5cb8c865d0d95';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef FetchPostRef = AutoDisposeFutureProviderRef<Post>;

/// See also [fetchPost].
@ProviderFor(fetchPost)
const fetchPostProvider = FetchPostFamily();

/// See also [fetchPost].
class FetchPostFamily extends Family<AsyncValue<Post>> {
  /// See also [fetchPost].
  const FetchPostFamily();

  /// See also [fetchPost].
  FetchPostProvider call({
    required AtUri uri,
  }) {
    return FetchPostProvider(
      uri: uri,
    );
  }

  @override
  FetchPostProvider getProviderOverride(
    covariant FetchPostProvider provider,
  ) {
    return call(
      uri: provider.uri,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPostProvider';
}

/// See also [fetchPost].
class FetchPostProvider extends AutoDisposeFutureProvider<Post> {
  /// See also [fetchPost].
  FetchPostProvider({
    required this.uri,
  }) : super.internal(
          (ref) => fetchPost(
            ref,
            uri: uri,
          ),
          from: fetchPostProvider,
          name: r'fetchPostProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPostHash,
          dependencies: FetchPostFamily._dependencies,
          allTransitiveDependencies: FetchPostFamily._allTransitiveDependencies,
        );

  final AtUri uri;

  @override
  bool operator ==(Object other) {
    return other is FetchPostProvider && other.uri == uri;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uri.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$postCommandHash() => r'56235dadff60b27639ac7b33c8a2202a430be510';

/// See also [PostCommand].
@ProviderFor(PostCommand)
final postCommandProvider =
    AutoDisposeAsyncNotifierProvider<PostCommand, void>.internal(
  PostCommand.new,
  name: r'postCommandProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$postCommandHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PostCommand = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
