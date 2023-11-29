import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:likeminds_feed/likeminds_feed.dart';
import 'package:likeminds_feed_ui_fl/likeminds_feed_ui_fl.dart';
import 'package:lm_feed_ui_example/services/likeminds_service.dart';
import 'package:lm_feed_ui_example/services/service_locator.dart';
import 'package:lm_feed_ui_example/utils/constants/ui_constants.dart';
import 'package:lm_feed_ui_example/views/feed/universal_feed/universal_feed_bloc.dart';
import 'package:lm_feed_ui_example/views/new_post/new_post/new_post_bloc.dart';
import 'package:lm_feed_ui_example/views/new_post/new_post_screen.dart';
import 'package:lm_feed_ui_example/views/post_detail/post_detail_screen.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  late final UniversalFeedBloc _feedBloc;

  final PagingController<int, Post> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    super.initState();
    // Bloc.observer = SimpleBlocObserver();
    _feedBloc = UniversalFeedBloc();
  }

  @override
  void dispose() {
    _feedBloc.close();
    _pagingController.dispose();
    super.dispose();
  }

  void _addPaginationListener() {
    _pagingController.addPageRequestListener((pageKey) {
      _feedBloc.add(GetUniversalFeed(offset: pageKey, forLoadMore: true));
    });
  }

  // refresh() => () {
  //       setState(() {});
  //     };

  int _page = 0;

  @override
  Widget build(BuildContext context) {
    _addPaginationListener();
    _feedBloc.add(GetUniversalFeed(offset: _page, forLoadMore: false));
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        centerTitle: false,
        title: Text(
          "Feed Sample",
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocConsumer(
        bloc: _feedBloc,
        listener: (context, state) {
          if (state is UniversalFeedLoaded) {
            _page++;
            if (state.feed.posts.length < 10) {
              _pagingController.appendLastPage(state.feed.posts);
            } else {
              _pagingController.appendPage(state.feed.posts, _page);
            }
          }
        },
        builder: ((context, state) {
          if (state is UniversalFeedLoaded) {
            GetFeedResponse feedResponse = state.feed;
            return PagedListView<int, Post>(
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Post>(
                itemBuilder: (context, item, index) => Column(
                  children: [
                    const SizedBox(height: 8),
                    LMPostWidget(
                      post: PostViewData.fromPost(post: item),
                      isFeed: true,
                      user: feedResponse.users[item.userId]!,
                      onTagTap: (String userId) {
                        locator<LikeMindsService>().routeToProfile(userId);
                      },
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider<NewPostBloc>(
                              create: (context) => NewPostBloc(),
                              child: PostDetailScreen(
                                postId: item.id,
                              ),
                            ),
                          ),
                        );
                      },
                      // refresh: refresh(),
                    ),
                  ],
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        }),
      ),
      floatingActionButton: LMTextButton(
        height: 48,
        width: 120,
        borderRadius: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        text: LMTextView(
          text: "New Post",
          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: LMIcon(
          type: LMIconType.icon,
          icon: Icons.add,
          size: 12,
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BlocProvider<NewPostBloc>(
                create: (context) => NewPostBloc(),
                child: const NewPostScreen(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class MyPostWidget extends LMPostWidget {
  const MyPostWidget({
    super.key,
    required PostViewData post,
    required User user,
    required Function() onTap,
    required bool isFeed,
    required Function(String) onTagTap,
  }) : super(
          post: post,
          user: user,
          onTap: onTap,
          isFeed: isFeed,
          onTagTap: onTagTap,
        );

  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        LMPostWidget(
          post: post,
          isFeed: true,
          user: user,
          onTap: onTap,
          onTagTap: onTagTap,
          // refresh: refresh(),
        ),
      ],
    );
  }
}
