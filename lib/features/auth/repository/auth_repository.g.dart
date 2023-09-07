// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authRepositoryHash() => r'b2f3129101356c2e70517fb7022e6482ddf45fa1';

/// See also [authRepository].
@ProviderFor(authRepository)
final authRepositoryProvider = AutoDisposeProvider<AuthRepository>.internal(
  authRepository,
  name: r'authRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AuthRepositoryRef = AutoDisposeProviderRef<AuthRepository>;
String _$authCommandHash() => r'24865f5e42f39d9cbf11ef04d7cdcd6fc21545d9';

/// See also [AuthCommand].
@ProviderFor(AuthCommand)
final authCommandProvider =
    AutoDisposeAsyncNotifierProvider<AuthCommand, void>.internal(
  AuthCommand.new,
  name: r'authCommandProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$authCommandHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthCommand = AutoDisposeAsyncNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
