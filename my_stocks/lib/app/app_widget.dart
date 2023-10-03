import 'package:flutter/material.dart';
import 'package:my_stocks/app/constraints/app_colors.dart';
import 'package:my_stocks/app/pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My stocks',
      theme: ThemeData(
        highlightColor: AppColors().colorPalette050,
        primaryColor: AppColors().colorPalette050,
        useMaterial3: true,
      ),
      home: const HomePage(title: 'My stocks'),
    );
  }
}
