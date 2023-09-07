// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRepositoryHash() => r'7d308c534a2d35a4381b0663f0946fff2206e573';

/// See also [searchRepository].
@ProviderFor(searchRepository)
final searchRepositoryProvider = AutoDisposeProvider<SearchRepository>.internal(
  searchRepository,
  name: r'searchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;
String _$fetchSearchTypeaheadHash() =>
    r'52a8f8992d4654eeeb2c81af1a7bda9602eec071';

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

typedef FetchSearchTypeaheadRef = AutoDisposeFutureProviderRef<List<Actor>>;

/// See also [fetchSearchTypeahead].
@ProviderFor(fetchSearchTypeahead)
const fetchSearchTypeaheadProvider = FetchSearchTypeaheadFamily();

/// See also [fetchSearchTypeahead].
class FetchSearchTypeaheadFamily extends Family<AsyncValue<List<Actor>>> {
  /// See also [fetchSearchTypeahead].
  const FetchSearchTypeaheadFamily();

  /// See also [fetchSearchTypeahead].
  FetchSearchTypeaheadProvider call({
    required String term,
  }) {
    return FetchSearchTypeaheadProvider(
      term: term,
    );
  }

  @override
  FetchSearchTypeaheadProvider getProviderOverride(
    covariant FetchSearchTypeaheadProvider provider,
  ) {
    return call(
      term: provider.term,
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
  String? get name => r'fetchSearchTypeaheadProvider';
}

/// See also [fetchSearchTypeahead].
class FetchSearchTypeaheadProvider
    extends AutoDisposeFutureProvider<List<Actor>> {
  /// See also [fetchSearchTypeahead].
  FetchSearchTypeaheadProvider({
    required this.term,
  }) : super.internal(
          (ref) => fetchSearchTypeahead(
            ref,
            term: term,
          ),
          from: fetchSearchTypeaheadProvider,
          name: r'fetchSearchTypeaheadProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchSearchTypeaheadHash,
          dependencies: FetchSearchTypeaheadFamily._dependencies,
          allTransitiveDependencies:
              FetchSearchTypeaheadFamily._allTransitiveDependencies,
        );

  final String term;

  @override
  bool operator ==(Object other) {
    return other is FetchSearchTypeaheadProvider && other.term == term;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, term.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
