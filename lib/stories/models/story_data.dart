import 'package:equatable/equatable.dart';
import 'package:never_flutter_sample_code/stories/models/content_data.dart';

/// ストーリーに関するデータクラス
class StoryData extends Equatable {
  const StoryData({
    required this.contentData,
    required this.userName,
  });

  final List<ContentData> contentData;
  final String userName;

  // ignore: prefer_constructors_over_static_methods
  static StoryData fromJson(Map<String, dynamic> mapData) {
    final list = mapData['list_images'] ;
    final dataList = (list as List<dynamic>).map((e) => e as Map<String, dynamic>).toList();
    return StoryData(
      userName: mapData['user_name'].toString(),
      contentData: dataList
          .map(ContentData.fromJson)
          .toList(),
    );
  }

  @override
  List<Object?> get props => [contentData, userName];
}
