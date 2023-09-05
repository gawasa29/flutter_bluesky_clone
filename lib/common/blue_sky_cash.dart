import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlueSkyCash {
  BlueSkyCash._();
  static Bluesky get instance {
    final defaultAppInstance = delegatePackingProperty!.data;

    return Bluesky.fromSession(defaultAppInstance);
  }

  static XRPCResponse<Session>? delegatePackingProperty;

  static Future<void> initializeApp() async {
    final prefs = await SharedPreferences.getInstance();

    final service = prefs.getString(AuthRepository.serviceKey);
    final id = prefs.getString(AuthRepository.idKey);
    final password = prefs.getString(AuthRepository.passwordKey);

    if (service == null || id == null || password == null) {
      print('service:$service id:$id password:$password');
      return;
    }

    delegatePackingProperty = await createSession(
      service: service,
      identifier: id,
      password: password,
    );
  }
}
