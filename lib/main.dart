import 'package:flutter/material.dart';
import 'package:flutter_task/core/constants/app_strings.dart';
import 'package:flutter_task/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/constants/app_colors.dart';



  void main() async {
    WidgetsFlutterBinding.ensureInitialized();

    try {
      await Firebase.initializeApp();
    } catch (e) {
      print('Firebase initialization error: $e');
    }

    runApp(MyApp());
  }


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      ),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }


}