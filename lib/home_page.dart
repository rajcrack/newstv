import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/controllers/category_controller.dart';

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

  @override
  void initState() {
    super.initState();
    // tabs.add(tab('Technology'));
    // tabs.add(tab('SPorts'));
    // tabs.add(tab('Try'));
    // tabs.add(tab('Catch'));
    // tabs.add(tab('Technology'));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() {
        if (categoriesController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return DefaultTabController(
            length:
                categoriesController.categoriesList.length,
            child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text('NewsTV'),
                bottom: TabBar(
                  tabs: categoriesController.categoriesList
                      .map((model) => tab(model.catTitle))
                      .toList(),
                  isScrollable: true,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorColor: Colors.white,
                ),
                actions: const [
                  Icon(Icons.search),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(Icons.notifications)
                ],
              ),
              body: TabBarView(
                  children: categoriesController
                      .categoriesList
                      .map((model) => NewsPage(
                          categoryId: model.id,
                          isreload: true))
                      .toList()),
              drawer: const MyDrawer(),
            ),
          );
        }
      }),
    );
  }
}

//----------- Tabs Print dialog---------------//
Widget tab(String tabname) {
  return Tab(
    text: tabname,
  );
}
