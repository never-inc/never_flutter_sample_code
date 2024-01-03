import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/stories/models/content_data.dart';
import 'package:never_flutter_sample_code/stories/screens/widgets/message_area.dart';
import 'package:never_flutter_sample_code/stories/screens/widgets/widget_error_image.dart';
import 'package:video_player/video_player.dart';

/// 画像や動画を表示するWidget
class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.contentData,
    required this.focusNode,
    required this.textController,
    required this.videoController,
    required this.isLongPress,
  });

  final ContentData contentData;
  final FocusNode focusNode;
  final TextEditingController textController;
  final VideoPlayerController? videoController;
  final bool isLongPress;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          key: const Key('widget_setup'),
          constraints: const BoxConstraints.expand(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: () {
              switch (widget.contentData.media) {
                case MediaType.image:

                  /// Preloader image
                  final image = NetworkImage(widget.contentData.url);
                  precacheImage(image, context);
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    child: Image(
                      excludeFromSemantics: true,
                      image: image,
                      fit: BoxFit.fitWidth,
                      frameBuilder: (_, child, ___, ____) => Padding(
                        key: const ValueKey('image_success'),
                        padding: const EdgeInsets.all(1),
                        child: child,
                      ),

                      /// Improved user experience to understand what's happening in all states
                      errorBuilder: (_, __, ___) => const WidgetErrorImage(
                        key: ValueKey('image_error'),
                      ),
                    ),
                  );
                case MediaType.video:
                  final videoController = widget.videoController;
                  if (videoController == null ||
                      !videoController.value.isInitialized) {
                    return const SizedBox.shrink();
                  }
                  return FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      key: const Key('video_success'),
                      width: videoController.value.size.width,
                      height: videoController.value.size.height,
                      child: VideoPlayer(videoController),
                    ),
                  );
              }
            }(),
          ),
        ),
        AnimatedOpacity(
          opacity: widget.isLongPress ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          child: MessageArea(
            focusNode: widget.focusNode,
            textController: widget.textController,
          ),
        ),
      ],
    );
  }
}
