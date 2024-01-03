import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/stories/models/story_data.dart';

/// アイコン、ユーザー名バーを表示するWidget
class Header extends StatelessWidget {
  const Header({
    super.key,
    required this.animationController,
    required this.currentIndex,
    required this.storyData,
  });

  final AnimationController animationController;
  final int currentIndex;
  final StoryData storyData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: Column(
        children: [
          Row(
            children: storyData.contentData
                .asMap()
                .map((i, e) {
                  return MapEntry(
                    i,
                    _AnimatedBar(
                      animationController: animationController,
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
                    storyData.userName,
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

/// ストーリーのヘッダーのバーの部分
class _AnimatedBar extends StatelessWidget {
  const _AnimatedBar({
    required this.animationController,
    required this.position,
    required this.currentIndex,
  });

  final AnimationController animationController;
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
                        animation: animationController,
                        builder: (context, child) {
                          return _Bar(
                            width: constraints.maxWidth *
                                animationController.value,
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
      height: 4, /// バーの高さ
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
