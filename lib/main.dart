import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newstv/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'NewsTV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.cyan[600]),
      ),
      home: const HomePage(),
    );
  }
}
