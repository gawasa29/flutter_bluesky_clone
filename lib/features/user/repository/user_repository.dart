import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

class UserRepository {
  UserRepository(this._bluesky);
  final Bluesky _bluesky;

  Future<ActorProfile> getProfile(String did) async {
    final response = await _bluesky.actors.findProfile(actor: did);
    return response.data;
  }
}

@riverpod
UserRepository userRepository(UserRepositoryRef ref) {
  return UserRepository(BlueSkyApp.instance);
}

@riverpod
Future<ActorProfile> fetchProfile(FetchProfileRef ref) {
  final did = BlueSkyApp.session!.data.did;

  return ref.watch(userRepositoryProvider).getProfile(did);
}
