import 'dart:async';
import 'dart:convert';

import 'package:never_flutter_sample_code/stories/models/story_data.dart';
import 'package:never_flutter_sample_code/utils/fixture_data.dart';

class ServiceStories extends RepositoryStory {
  ServiceStories(){
    /// Default data
    _scrollableState.add(false);
  }
  final _scrollableState = StreamController<bool>();
  Stream<bool> get scrollableStateStream => _scrollableState.stream;
  void changeStateScrollable({required bool scrollableChange}) {
    _scrollableState.add(scrollableChange);
  }
}

class RepositoryStory {
  /// 表示するストーリーのデータ
  Future<List<StoryData>> getStoryData() async {
    final fixtureData = await fixture('assets/fixture_data/story_data.json');
    final list = (jsonDecode(fixtureData) as Map<String, dynamic>)['list_data'];
    final preparedData = (list as List<dynamic>).map((e) => e as Map).toList();
    return preparedData
        .map((elem) => StoryData.fromJson(elem as Map<String, dynamic>))
        .toList();
  }
}
