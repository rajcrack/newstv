// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/posts_controller.dart';
import 'widget/news_card_widget.dart';

class NewsPage extends StatefulWidget {
  NewsPage(
      {super.key,
      required this.categoryId,
      required this.isreload});
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
      if (widget.isreload) {
        await postsController.fetchPosts(
            categoryId: widget.categoryId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return NewsList();
  }

  //------News List Widget-------//
  Widget NewsList() {
    return Obx(() {
      if (postsController.isLoading.value) {
        return const CircularProgressIndicator();
      }
      return RefreshIndicator(
        onRefresh: () => postsController.fetchPosts(
            categoryId: widget.categoryId),
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
    });
  }
}
