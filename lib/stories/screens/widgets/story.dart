import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/stories/models/content_data.dart';
import 'package:never_flutter_sample_code/stories/models/story_data.dart';
import 'package:never_flutter_sample_code/stories/screens/widgets/content.dart';
import 'package:never_flutter_sample_code/stories/screens/widgets/header.dart';
import 'package:video_player/video_player.dart';

// ユーザー毎のストーリーを表示するWidget
class Story extends StatefulWidget {
  const Story({
    super.key,
    required this.pagesControl,
    required this.storyData,
    required this.isLastStory,
    required this.updateScrollable,
  });

  final PageController pagesControl;
  final StoryData storyData;

  // StoriesScreenでのスクロール可否を変更するための関数
  final void Function({bool? value}) updateScrollable;

  // 最後のストーリーかどうかのフラグ
  final bool isLastStory;

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _animationController;
  VideoPlayerController? _videoController;
  final _textController = TextEditingController();
  final _focusNode = FocusNode();

  // ストーリーに表示させるコンテンツのindex
  int _currentIndex = 0;

  // 長押し時のフラグ
  bool isLongPress = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _animationController = AnimationController(vsync: this);
    _focusNode.addListener(() {
      // キーボードが表示されている場合の挙動の制御
      // キーボードが表示された場合はアニメーションや動画の再生を停止する
      if (_focusNode.hasFocus) {
        _animationController.stop();
        if (_videoController != null && _videoController!.value.isPlaying) {
          _videoController!.pause();
        }
        // StoriesScreenの横スクロールを無効にする
        widget.updateScrollable(value: false);
      } else {
        // キーボードが閉じられた場合はアニメーションや動画の再生を再開する
        _animationController.forward();
        if (_videoController != null && !_videoController!.value.isPlaying) {
          _videoController!.play();
        }
        // StoriesScreenの横スクロールを有効にする
        widget.updateScrollable(value: true);
      }
    });

    if (widget.storyData.contentData.first.media == MediaType.video) {
      _videoController = VideoPlayerController.network(
        widget.storyData.contentData.first.url,
      )..initialize().then((_) {
          setState(() {});
        });
    }

    final firstContentData = widget.storyData.contentData.first;
    _loadStory(contentData: firstContentData, animateToPage: false);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController
          ..stop()
          ..reset();
        _textController.clear();
        if (_currentIndex + 1 < widget.storyData.contentData.length) {
          setState(() {
            _currentIndex += 1;
          });
          _loadStory(
            contentData: widget.storyData.contentData[_currentIndex],
          );
        } else {
          // 最後のページの場合は次のストーリーに遷移する
          widget.isLastStory
              ? Navigator.pop(context)
              : widget.pagesControl.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    _videoController?.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final contentData = widget.storyData.contentData[_currentIndex];
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
                  _onTapUp(
                    details: details,
                    contentData: contentData,
                    textController: _textController,
                    isLastStory: widget.isLastStory,
                  );
                }
              },

              // 長押し時の場合にはアニメーションや動画の再生を停止する
              onLongPressStart: (details) {
                // キーボードが表示されている場合は処理を行わない
                if (_focusNode.hasFocus) {
                  return;
                }

                _animationController.stop();
                if (_videoController != null &&
                    _videoController!.value.isPlaying) {
                  _videoController!.pause();
                }

                setState(() {
                  isLongPress = true;
                });
              },

              // 長押し終了の場合にはアニメーションや動画の再生を再開する
              onLongPressEnd: (details) {
                // キーボードが表示されている場合は処理を行わない
                if (_focusNode.hasFocus) {
                  return;
                }
                _animationController.forward();
                if (_videoController != null &&
                    !_videoController!.value.isPlaying) {
                  _videoController!.play();
                }

                setState(() {
                  isLongPress = false;
                });
              },
              child: PageView.builder(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.storyData.contentData.length,
                itemBuilder: (context, i) {
                  final contentData = widget.storyData.contentData[i];
                  return Content(
                    contentData: contentData,
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
              child: Header(
                animationController: _animationController,
                currentIndex: _currentIndex,
                storyData: widget.storyData,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // タップ時に前後の画像を表示するための処理
  void _onTapUp({
    required TapUpDetails details,
    required ContentData contentData,
    required TextEditingController textController,
    required bool isLastStory,
  }) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dx = details.globalPosition.dx;
    textController.clear();

    // 画面の左側の1/3をタップした場合
    if (dx < screenWidth / 3) {
      // 1枚目以外の場合
      if (_currentIndex - 1 >= 0) {
        setState(() {
          _currentIndex -= 1;
        });
        _loadStory(contentData: widget.storyData.contentData[_currentIndex]);
      } else {
        // 初回ページの場合は処理終了する
        if (widget.pagesControl.page == 0) {
          return;
        }
        widget.pagesControl.previousPage(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    } else {
      // 画面のその他をタップした場合
      if (_currentIndex + 1 < widget.storyData.contentData.length) {
        setState(() {
          _currentIndex += 1;
        });
        _loadStory(contentData: widget.storyData.contentData[_currentIndex]);
      } else {
        isLastStory
            ? Navigator.pop(context)
            : widget.pagesControl.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
      }
    }
  }

  // 画像や動画の読み込み処理
  void _loadStory({
    required ContentData contentData,
    bool animateToPage = true,
  }) {
    _animationController
      ..stop()
      ..reset();
    switch (contentData.media) {
      case MediaType.image:
        // １つ画像の表示する時間を設定
        _animationController.duration = const Duration(seconds: 3);
        _animationController.forward();
        break;
      case MediaType.video:
        _videoController?.dispose();
        _videoController = VideoPlayerController.network(contentData.url)
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
