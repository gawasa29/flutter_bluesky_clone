import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/common/blue_sky_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(PostRepositoryRef ref) {
  return PostRepository(BlueSkyApp.instance);
}

@riverpod
Future<List<FeedView>> fetchFeeds(FetchFeedsRef ref) async {
  final feeds = await ref.watch(postRepositoryProvider).getFeed();

  final feedViewList = feeds.feed;

  return feedViewList;
}

class PostRepository {
  PostRepository(this._bluesky);
  final Bluesky _bluesky;

  Future<Feed> getFeed({String? cursor}) async {
    final response =
        await _bluesky.feeds.findTimeline(limit: 100, cursor: cursor);

    return response.data;
  }
}
