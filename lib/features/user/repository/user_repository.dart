import 'package:bluesky/bluesky.dart' as bsky;
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(BlueSkyApp.instance);
}

class UserRepository {
  UserRepository(this._bluesky);
  final bsky.Bluesky _bluesky;

  Future<bsky.ActorProfile> getProfile(String did) async {
    final response = await _bluesky.actors.findProfile(actor: did);
    return response.data;
  }
}