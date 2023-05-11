import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/stories/models/content_data.dart';
import 'package:never_flutter_sample_code/stories/models/story_data.dart';
import 'package:never_flutter_sample_code/stories/screens/story/story.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  late PageController _pageController;
  final focusNode = FocusNode();
  bool isScrollable = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      physics: isScrollable ? null : const NeverScrollableScrollPhysics(),
      itemCount: stories.length,
      itemBuilder: (context, i) {
        final story = stories[i];
        return Story(
          pagesControl: _pageController,
          storyData: story,
          isLastStory: i + 1 == stories.length,
          updateScrollable: (bool value) {
            setState(() {
              isScrollable = value;
            });
          },
        );
      },
    );
  }
}

// 表示するストーリーのデータ
final List<StoryData> stories = [
  const StoryData(
    userName: 'never_inc',
    contentData: [
      ContentData(
        url:
            'https://images.pexels.com/photos/1450082/pexels-photo-1450082.jpeg?auto=compress&cs=tinysrgb&w=1600',
        media: MediaType.image,
      ),
      ContentData(
        url:
            'https://images.pexels.com/photos/1624438/pexels-photo-1624438.jpeg?auto=compress&cs=tinysrgb&w=1600',
        media: MediaType.image,
      ),
      ContentData(
        url:
            'https://joy1.videvo.net/videvo_files/video/free/2019-11/large_watermarked/190301_1_25_11_preview.mp4',
        media: MediaType.video,
      ),
      ContentData(
        url:
            'https://images.pexels.com/photos/1785493/pexels-photo-1785493.jpeg?auto=compress&cs=tinysrgb&w=1600',
        media: MediaType.image,
      ),
    ],
  ),
  const StoryData(
    userName: 'hoge_inc',
    contentData: [
      ContentData(
        url:
            'https://cdn.pixabay.com/photo/2014/02/27/16/09/sunset-275978_1280.jpg',
        media: MediaType.image,
      ),
      ContentData(
        url:
            'https://cdn.pixabay.com/photo/2016/10/07/18/32/vintage-1722329_1280.jpg',
        media: MediaType.image,
      ),
    ],
  ),
];
