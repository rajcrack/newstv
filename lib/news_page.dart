import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/controllers/posts_controller.dart';
import 'package:newstv/widget/news_card_widget.dart';

class NewsPage extends StatefulWidget {
  NewsPage(
      {required this.categoryId, required this.isreload});
  String categoryId;
  bool isreload;

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  PostsController postsController =
      Get.put(PostsController());
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration.zero, () async {
      if (this.widget.isreload) {
        await postsController.fetchPosts(
            categoryId: this.widget.categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NewsList();
  }

  //------News List Widget-------//
  Widget NewsList() {
    return Container(
      child: Obx(() {
        if (postsController.isLoading.value) {
          return CircularProgressIndicator();
        }
        return RefreshIndicator(
          onRefresh: () => postsController.fetchPosts(
              categoryId: this.widget.categoryId),
          key: refreshKey,
          child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: postsController.postsList.length,
            itemBuilder: (BuildContext context, int index) {
              return NewsCardWidget(
                  model: postsController.postsList[index]);
            },
          ),
        );
      }),
    );
  }
}
