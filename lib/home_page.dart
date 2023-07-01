import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/category_controller.dart';
import 'controllers/postDetail_controller.dart';
import 'news_page.dart';
import 'widget/drawer_for_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<Widget> tabs = [];
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final PostDetailController postDetailController =
      Get.put(PostDetailController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: postDetailController.dark.isFalse
          ? Colors.white
          : Colors.black,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Free Fire Event'),
          actions: [
            IconButton(
                onPressed: () {
                  postDetailController.darkMode();
                },
                icon: Icon(
                  postDetailController.dark.isFalse
                      ? CupertinoIcons.moon
                      : CupertinoIcons.sun_max_fill,
                ))
          ],
        ),
        body: Container(
            color: postDetailController.dark.isFalse
                ? Colors.white
                : Colors.black26,
            child: NewsPage(
              categoryId: 'qwa',
              isreload: true,
            )),
        drawer: const MyDrawer(),
      ),
    );
  }
}
