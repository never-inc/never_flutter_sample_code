import 'package:equatable/equatable.dart';
import 'package:never_flutter_sample_code/stories/models/content_data.dart';

// ストーリーに関するデータクラス
class StoryData extends Equatable {
  const StoryData({
    required this.contentData,
    required this.userName,
  });

  final List<ContentData> contentData;
  final String userName;

  @override
  List<Object?> get props => [contentData, userName];
}
