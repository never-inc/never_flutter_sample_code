import 'package:equatable/equatable.dart';

// 画像か動画かを判別するためのenum
enum MediaType {
  image,
  video,
}

// ストーリーのコンテンツに関するデータクラス
class ContentData extends Equatable {
  const ContentData({
    required this.url,
    required this.media,
  });

  final String url;
  final MediaType media;

  @override
  List<Object?> get props => [url, media];
}
