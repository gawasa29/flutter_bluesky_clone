import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/blue_sky_app.dart';
import 'package:flutter_bluesky_clone/common/error/error.dart';
import 'package:flutter_bluesky_clone/features/auth/view/welcome_screen.dart';
import 'package:flutter_bluesky_clone/features/post/view/home_screen.dart';
import 'package:flutter_bluesky_clone/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) =>
    throw UnimplementedError();

class AuthRepository {
  AuthRepository(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  static const serviceKey = 'service';
  static const idKey = 'id';
  static const passwordKey = 'password';

  Future<void> setService(String service) async {
    await sharedPreferences.setString(serviceKey, service);
  }

  Future<void> setId(String id) async {
    await sharedPreferences.setString(idKey, id);
  }

  Future<void> setPassword(String password) async {
    await sharedPreferences.setString(passwordKey, password);
  }

  String getService() => sharedPreferences.getString(serviceKey) ?? '';

  String getId() => sharedPreferences.getString(idKey) ?? '';

  String getPassword() => sharedPreferences.getString(passwordKey) ?? '';

  void removeService() => sharedPreferences.remove(serviceKey);

  void removeId() => sharedPreferences.remove(idKey);

  void removePassword() => sharedPreferences.remove(passwordKey);

  Future<void> createSessionRepo({
    required String service,
    required String id,
    required String password,
  }) async {
    await createSession(
      service: service,
      identifier: id,
      password: password,
    );
  }
}

@riverpod
class AuthCommand extends _$AuthCommand {
  @override
  FutureOr<void> build() {}

  Future<void> signIn({
    required String service,
    required String id,
    required String password,
  }) async {
    try {
      state = const AsyncLoading();

      final authRepository = ref.watch(authRepositoryProvider);

      await authRepository.createSessionRepo(
        service: service,
        id: id,
        password: password,
      );

      await authRepository.setService(service);
      await authRepository.setId(id);
      await authRepository.setPassword(password);

      // To update the session
      await BlueSkyApp.initializeApp();

      state = const AsyncData(null);

      if (state.hasError == false) {
        ref.read(routerProvider).go(HomeScreen.routePath);
      }
    } on UnauthorizedException catch (e, stackTrace) {
      final errorMessage = parseError(e);

      if (errorMessage == null) return;

      state = AsyncError(errorMessage, stackTrace);
    } on XRPCException catch (e, stackTrace) {
      final errorMessage = parseError(e);

      if (errorMessage == null) return;

      state = AsyncError(errorMessage, stackTrace);
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    ref.read(authRepositoryProvider)
      ..removeService()
      ..removeId()
      ..removePassword();

    await BlueSkyApp.initializeApp();
    state = const AsyncData(null);

    if (state.hasError == false) {
      ref.read(routerProvider).go(WelcomeScreen.routePath);
    }
  }
}
