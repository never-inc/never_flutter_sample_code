import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

enum TabItem {
  post(
    title: '投稿',
  ),
  favorite(
    title: 'いいね',
  ),
  ;

  const TabItem({required this.title});

  final String title;
}

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: TabItem.values.length);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: TabItem.values.length,
        child: ExtendedNestedScrollView(
          onlyOneScrollInBody: true,
          // タブを上で固定するためにヘッダーの合計の高さを指定
          pinnedHeaderSliverHeightBuilder: () {
            return kToolbarHeight + MediaQuery.of(context).padding.top;
          },
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true, // スクロースした時に上にAppBarが表示されたままになる
                title: Text(
                  'プロフィール',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const ClipOval(
                                  child: SizedBox(
                                    width: 64,
                                    height: 64,
                                    child: ColoredBox(
                                      color: Color(0xFFd5d5d5),
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 64 * 0.8,
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: const StadiumBorder(),
                                    elevation: 0,
                                  ),
                                  onPressed: () async {},
                                  child: Text(
                                    'フォローする',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              '株式会社Never',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '@never_inc',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              '株式会社Neverとはモバイルアプリケーションをメインに開発、運用をおこなっております。',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              TabBar(
                controller: _tabController,
                tabs: TabItem.values.map((e) => Tab(text: e.title)).toList(),
                indicatorColor: Colors.blue,
                labelColor: Colors.blue,
                labelPadding: EdgeInsets.zero,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    ListView.separated(
                      key: PageStorageKey<String>(TabItem.post.title),
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return PostTile(
                          index: index,
                          userName: '株式会社Never',
                          userId: '@never_inc',
                        );
                      },
                      separatorBuilder: (context, _) {
                        return const Divider(height: 1);
                      },
                    ),
                    ListView.separated(
                      key: PageStorageKey<String>(TabItem.favorite.title),
                      itemCount: 100,
                      itemBuilder: (BuildContext context, int index) {
                        return PostTile(
                          index: index,
                          userName: 'HOGEHOGE',
                          userId: '@hoge_hoge',
                        );
                      },
                      separatorBuilder: (context, _) {
                        return const Divider(height: 1);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  const PostTile({
    super.key,
    required this.index,
    required this.userName,
    required this.userId,
  });
  final int index;
  final String userName;
  final String userId;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const ClipOval(
        child: SizedBox(
          width: 32,
          height: 32,
          child: ColoredBox(
            color: Color(0xFFd5d5d5),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 32 * 0.8,
            ),
          ),
        ),
      ),
      title: RichText(
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: userName,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const WidgetSpan(
              child: SizedBox(width: 4),
            ),
            TextSpan(
              text: userId,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          'Index is $index',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
