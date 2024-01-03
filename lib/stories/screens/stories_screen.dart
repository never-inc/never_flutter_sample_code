import 'package:flutter/material.dart';
import 'package:never_flutter_sample_code/stories/models/story_data.dart';
import 'package:never_flutter_sample_code/stories/screens/widgets/story.dart';
import 'package:never_flutter_sample_code/stories/service_stories.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({super.key});

  @override
  State<StoriesScreen> createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  late PageController _pageController;
  final focusNode = FocusNode();
  bool isScrollable = true;
  late final ServiceStories storeService;

  @override
  void initState() {
    super.initState();
    storeService = ServiceStories();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(_) {
    return FutureBuilder(
      future: storeService.getStoryData(),
      builder: (context, asyncFuture) {
        if (!asyncFuture.hasData) {
          return const CircularProgressIndicator();
        }
        if (asyncFuture.hasError) {
          return Text(
            'Error...',
            style: Theme.of(context).textTheme.bodyLarge,
          );
        }
        final listData = asyncFuture.data as List<StoryData>?;
        if (listData == null) {
          return Text(
            'Empty...',
            style: Theme.of(context).textTheme.bodyLarge,
          );
        }
        return _pageView(listData);
      },
    );
  }

  Widget _pageView(List<StoryData> stories) {
    return StreamBuilder(
      stream: storeService.scrollableStateStream,
      builder: (context, snapshot) {
        final scrollableState = snapshot.data ?? false;
        return PageView.builder(
          controller: _pageController,
          physics:
              scrollableState ? null : const NeverScrollableScrollPhysics(),
          itemCount: stories.length,
          itemBuilder: (_, i) {
            return Story(
              pagesControl: _pageController,
              storyData: stories[i],
              isLastStory: i + 1 == stories.length,
              updateScrollable: (value) {
                storeService.changeStateScrollable(scrollableChange: value);
              },
            );
          },
        );
      },
    );
  }
}
