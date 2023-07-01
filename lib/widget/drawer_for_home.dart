import 'package:freeFireevent/controllers/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/category_controller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final CategoriesController categoriesController =
      Get.put(CategoriesController());
  final PostsController _postsController =
      Get.put(PostsController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
        width: Get.width * 0.6,
        child: DrawerHeader(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 245, 249, 255)),
          child: Obx(
            () => ListView(
                children: categoriesController
                    .categoriesList
                    .map((model) => list(
                        listitem: model.catTitle,
                        id: model.id))
                    .toList()),
          ),
        ));
  }

  Widget list({required String listitem, required id}) {
    return Padding(
        padding: const EdgeInsets.only(
            top: 2, left: 12, right: 12),
        child: ListTile(
          // dense: true,
          tileColor: Colors.white70,
          hoverColor: Colors.cyan,
          visualDensity:
              VisualDensity.adaptivePlatformDensity,
          splashColor:
              const Color.fromARGB(255, 133, 84, 69),
          title: Text(listitem),
          titleAlignment: ListTileTitleAlignment.center,
          onTap: () =>
              _postsController.fetchPosts(categoryId: id),
        ));
  }
}
