import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'home_page.dart';
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
      title: 'freefireevent',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.cyan[600]),
      ),
      home: AnimatedSplashScreen(
        nextScreen: const HomePage(),
        splash: Image.asset('assets/images/event.png',
            width: Get.width * 0.9),
        backgroundColor: Colors.blue,
        animationDuration:
            const Duration(milliseconds: 300),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
