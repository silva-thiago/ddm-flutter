import 'package:flutter/material.dart';
import 'package:meu_imc/constraints/colors.dart';
import 'package:meu_imc/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu IMC',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: AppColor().lightestBackground),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'IMC'),
    );
  }
}
