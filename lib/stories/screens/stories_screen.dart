import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({
    super.key,
  });

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;

  late AnimationController _animationController;
  VideoPlayerController? _videoController;
  int _currentIndex = 0;
  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool hasText = false;
  bool isLongPress = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _focusNode.addListener(() {
      setState(() {
        // キーボードが表示されている場合の挙動の制御
        // キーボードが表示された場合はアニメーションや動画の再生を停止する
        if (_focusNode.hasFocus) {
          _animationController.stop();
          if (_videoController != null && _videoController!.value.isPlaying) {
            _videoController!.pause();
          }
        } else {
          // キーボードが閉じられた場合はアニメーションや動画の再生を再開する
          _animationController.forward();
          if (_videoController != null && !_videoController!.value.isPlaying) {
            _videoController!.play();
          }
        }
      });
    });
    _animationController = AnimationController(vsync: this);
    if (stories.first.media == MediaType.video) {
      _videoController = VideoPlayerController.network(
        stories.first.url,
      )..initialize().then((_) {
          setState(() {});
        });
    }

    final firstStory = stories.first;
    _loadStory(story: firstStory, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController
          ..stop()
          ..reset();
        setState(() {
          if (_currentIndex + 1 < stories.length) {
            _currentIndex += 1;
            _loadStory(story: stories[_currentIndex]);
          } else {
            _currentIndex = 0;
            _loadStory(story: stories[_currentIndex]);
          }
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final story = stories[_currentIndex];
    return SafeArea(
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.black,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            GestureDetector(
              // 画面タップ時の処理
              onTapUp: (details) {
                // キーボードが表示されている場合はキーボードのフォーカスを外すのみ
                if (_focusNode.hasFocus) {
                  FocusScope.of(context).unfocus();
                } else {
                  _onTapUp(details, story);
                }
              },

              // 長押し時の場合にはアニメーションや動画の再生を停止する
              onLongPressStart: (details) {
                // キーボードが表示されている場合は処理を行わない
                if (_focusNode.hasFocus) {
                  return;
                }

                setState(() {
                  isLongPress = true;
                  _animationController.stop();
                  if (_videoController != null &&
                      _videoController!.value.isPlaying) {
                    _videoController!.pause();
                  }
                });
              },

              // 長押し終了の場合にはアニメーションや動画の再生を再開する
              onLongPressEnd: (details) {
                // キーボードが表示されている場合は処理を行わない
                if (_focusNode.hasFocus) {
                  return;
                }
                setState(() {
                  isLongPress = false;
                  _animationController.forward();
                  if (_videoController != null &&
                      !_videoController!.value.isPlaying) {
                    _videoController!.play();
                  }
                });
              },
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: stories.length,
                itemBuilder: (context, i) {
                  final story = stories[i];
                  return StoryContent(
                    story: story,
                    focusNode: _focusNode,
                    textController: _textController,
                    videoController: _videoController,
                    isLongPress: isLongPress,
                  );
                },
              ),
            ),

            // ヘッダー部分(時間のバーとサムネ、ユーザ名)
            AnimatedOpacity(
              opacity: isLongPress ? 0.0 : 1.0,
              duration: const Duration(milliseconds: 500),
              child: StoriesHeader(
                animController: _animationController,
                currentIndex: _currentIndex,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // タップ時に前後の画像を表示するための処理
  void _onTapUp(TapUpDetails details, Story story) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;

    // 画面の左側の1/3をタップした場合
    if (dx < screenWidth / 3) {
      setState(() {
        if (_currentIndex - 1 >= 0) {
          _currentIndex -= 1;
          _loadStory(story: stories[_currentIndex]);
        }
      });
    } else {
      // 画面のその他をタップした場合
      setState(() {
        if (_currentIndex + 1 < stories.length) {
          _currentIndex += 1;
          _loadStory(story: stories[_currentIndex]);
        } else {
          _currentIndex = 0;
          _loadStory(story: stories[_currentIndex]);
        }
      });
    }
  }

  void _loadStory({required Story story, bool animateToPage = true}) {
    _animationController
      ..stop()
      ..reset();
    switch (story.media) {
      case MediaType.image:
        // １つ画像の表示する時間を設定
        _animationController.duration = const Duration(seconds: 5);
        _animationController.forward();
        break;
      case MediaType.video:
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(story.url)
          ..initialize().then((_) {
            setState(() {});
            if (_videoController != null &&
                _videoController!.value.isInitialized) {
              // ビデオの長さ分の時間を設定
              _animationController.duration = _videoController!.value.duration;
              _videoController!.play();
              _animationController.forward();
            }
          });
        break;
    }
    if (animateToPage) {
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 1),
        curve: Curves.easeInOut,
      );
    }
  }
}

class StoryContent extends StatefulWidget {
  const StoryContent({
    super.key,
    required this.story,
    required this.focusNode,
    required this.textController,
    required this.videoController,
    required this.isLongPress,
  });

  final Story story;
  final FocusNode focusNode;
  final TextEditingController textController;
  final VideoPlayerController? videoController;
  final bool isLongPress;

  @override
  State<StoryContent> createState() => _StoryContentState();
}

class _StoryContentState extends State<StoryContent> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints.expand(),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: () {
              switch (widget.story.media) {
                case MediaType.image:
                  return Container(
                    constraints: const BoxConstraints.expand(),
                    child: Image(
                      image: NetworkImage(widget.story.url),
                      fit: BoxFit.fitWidth,
                    ),
                  );
                case MediaType.video:
                  if (widget.videoController == null ||
                      !widget.videoController!.value.isInitialized) {
                    return const SizedBox.shrink();
                  }
                  return FittedBox(
                    fit: BoxFit.fitWidth,
                    child: SizedBox(
                      width: widget.videoController!.value.size.width,
                      height: widget.videoController!.value.size.height,
                      child: VideoPlayer(widget.videoController!),
                    ),
                  );
              }
            }(),
          ),
        ),
        AnimatedOpacity(
          opacity: widget.isLongPress ? 0.0 : 1.0,
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

// アイコンとユーザー名を表示する部分
class StoriesHeader extends StatelessWidget {
  const StoriesHeader({
    super.key,
    required this.animController,
    required this.currentIndex,
  });

  final AnimationController animController;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          Row(
            children: stories
                .asMap()
                .map((i, e) {
                  return MapEntry(
                    i,
                    _AnimatedBar(
                      animController: animController,
                      position: i,
                      currentIndex: currentIndex,
                    ),
                  );
                })
                .values
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: ClipOval(
                    child: SizedBox(
                      width: 32,
                      height: 32,
                      child: ColoredBox(
                        color: Color(0xFFd5d5d5),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 24 * 0.8,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    'never_inc',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.close,
                    size: 32,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// メッセージの入力欄
class MessageArea extends StatefulWidget {
  const MessageArea({
    super.key,
    required this.focusNode,
    required this.textController,
  });

  final FocusNode focusNode;
  final TextEditingController textController;

  @override
  State<MessageArea> createState() => _MessageAreaState();
}

class _MessageAreaState extends State<MessageArea> {
  bool hasText = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8,
                      ),
                      child: TextField(
                        focusNode: widget.focusNode,
                        controller: widget.textController,
                        maxLines: 4,
                        minLines: 1,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          hintText: 'メッセージを送信',
                          hintStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                          suffixIcon: widget.focusNode.hasFocus
                              ? hasText
                                  ? TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        '送信',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyLarge?.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                      ),
                                    )
                                  : IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.gif_box_outlined,
                                        color: Colors.white,
                                        size: 32,
                                      ),
                                    )
                              : const SizedBox.shrink(),
                        ),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: Colors.white, fontSize: 16),
                        onChanged: (value) {
                          setState(() {
                            hasText = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                  ),
                  widget.focusNode.hasFocus
                      ? const SizedBox.shrink()
                      : Row(
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                              onPressed: () => {},
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.send,
                                color: Colors.white,
                              ),
                              onPressed: () => {},
                            ),
                          ],
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ストーリーのヘッダーのバーの部分
class _AnimatedBar extends StatelessWidget {
  const _AnimatedBar({
    required this.animController,
    required this.position,
    required this.currentIndex,
  });

  final AnimationController animController;
  final int position;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _Bar(
                  width: double.infinity,
                  color: position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                        animation: animController,
                        builder: (context, child) {
                          return _Bar(
                            width: constraints.maxWidth * animController.value,
                          );
                        },
                      )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({
    required this.width,
    this.color = Colors.white,
  });

  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4, // バーの高さ
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

enum MediaType {
  image,
  video,
}

class Story {
  const Story({
    required this.url,
    required this.media,
    // required this.duration,
  });

  final String url;
  final MediaType media;
// final Duration duration;
}

final List<Story> stories = [
  const Story(
    url:
        'https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600',
    media: MediaType.image,
    // duration: Duration(seconds: 10),
  ),
  const Story(
    url:
        'https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&w=1600',
    media: MediaType.image,
    // duration: Duration(seconds: 7),
  ),
  const Story(
    url:
        'https://joy1.videvo.net/videvo_files/video/free/2019-11/large_watermarked/190301_1_25_11_preview.mp4',
    media: MediaType.video,
    // duration: Duration.zero,
  ),
  const Story(
    url:
        'https://images.pexels.com/photos/1785493/pexels-photo-1785493.jpeg?auto=compress&cs=tinysrgb&w=1600',
    media: MediaType.image,
    // duration: Duration(seconds: 5),
  ),
  // const Story(
  //   url:
  //       'https://player.vimeo.com/external/336859936.sd.mp4?s=54fa7a2fc222f135b2b348bf4e792372736e52b2&profile_id=164&oauth2_token_id=57447761',
  //   media: MediaType.video,
  //   // duration: Duration.zero,
  // ),
];
