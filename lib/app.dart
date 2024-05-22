import 'package:alhadith/ui/screens/splash.dart';
import 'package:alhadith/ui/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/books_controller.dart';
import 'controller/chapter_controller.dart';
import 'controller/hadith_controller.dart';
import 'controller/section_controller.dart';
import 'data/db_helper/dbhelper.dart';

class AlHadisApp extends StatelessWidget {
  const AlHadisApp({super.key});

  static GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
          primaryColor: Colors.green,
          appBarTheme: const AppBarTheme(
              color: greenColor, iconTheme: IconThemeData(color: Colors.white)),
          colorScheme: ColorScheme.fromSwatch(
            backgroundColor: bodyBackGroundColor,
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white)),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: greenColor),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                fontFamily: 'kalpurush'),
            displaySmall: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.75,
                fontSize: 19,
                color: Colors.black,
                fontFamily: 'kalpurush'),
            labelMedium: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: 0.75,
                fontSize: 19,
                color: greyTextColor,
                fontFamily: 'kalpurush'),
            labelSmall: TextStyle(
                fontWeight: FontWeight.w600,
                letterSpacing: 0.75,
                fontSize: 14,
                color: Colors.grey,
                fontFamily: 'kalpurush'),
          )),
      initialBinding: ControllerBinders(),
    );
  }
}

class ControllerBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(DbHelperController());
    Get.put((BooksQueryController()));
    Get.put((ChapterQueryController()));
    Get.put((HadithQueryController()));
    Get.put((SectionQueryController()));
  }
}
