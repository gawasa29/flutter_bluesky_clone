import 'package:bluesky/bluesky.dart';
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
