import 'package:equatable/equatable.dart';

/// 画像か動画かを判別するためのenum
enum MediaType {
  image,
  video,
}

/// ストーリーのコンテンツに関するデータクラス
class ContentData extends Equatable {
  const ContentData({
    required this.url,
    required this.media,
  });

  final String url;
  final MediaType media;

  // ignore: prefer_constructors_over_static_methods
  static ContentData fromJson(Map<String, dynamic> map) {
    return ContentData(
      media: _convertType(map['media_type'].toString()),
      url: map['url'].toString(),
    );
  }

  static MediaType _convertType(String type) {
    switch (type) {
      case 'image':
        return MediaType.image;
      case 'video':
        return MediaType.video;
      default:
        return MediaType.image;
    }
  }

  @override
  List<Object?> get props => [url, media];
}
