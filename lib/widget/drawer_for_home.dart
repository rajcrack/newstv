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
  @override
  Widget build(BuildContext context) {
    return const Drawer(
      child: Text('Rishabh'),
    );
  }
}
