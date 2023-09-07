import 'package:bluesky/bluesky.dart';
import 'package:flutter_bluesky_clone/blue_sky_app.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_repository.g.dart';

class SearchRepository {
  SearchRepository(this._bluesky);
  final Bluesky _bluesky;

  Future<ActorsTypeahead> getSearchTypeahead(String term) async {
    final response = await _bluesky.actors.searchTypeahead(term: term);
    return response.data;
  }
}

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) {
  return SearchRepository(BlueSkyApp.instance);
}

@riverpod
Future<List<Actor>> fetchSearchTypeahead(
  FetchSearchTypeaheadRef ref, {
  required String term,
}) async {
  final actorsTypeahead =
      await ref.watch(searchRepositoryProvider).getSearchTypeahead(term);

  final actorList = actorsTypeahead.actors;

  return actorList;
}
