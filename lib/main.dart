import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:newstv/home_page.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  await GetStorage.init();
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
      //   AnimatedSplashScreen(
      // nextScreen: const HomePage(),
      // splash: null,
      // ),
    );
  }
}
