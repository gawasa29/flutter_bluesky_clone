import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/features/auth/repository/auth_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BlueSkyApp {
  BlueSkyApp._();

  static XRPCResponse<Session>? session;

  static Bluesky get instance {
    final sessionInstance = session!.data;

    return Bluesky.fromSession(sessionInstance);
  }

  static Future<void> initializeApp() async {
    final prefs = await SharedPreferences.getInstance();

    final service = prefs.getString(AuthRepository.serviceKey);
    final id = prefs.getString(AuthRepository.idKey);
    final password = prefs.getString(AuthRepository.passwordKey);

    if (service == null || id == null || password == null) {
      print('service:$service id:$id password:$password');
      return;
    }

    session = await createSession(
      service: service,
      identifier: id,
      password: password,
    );
  }
}
