import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_you_do/app/pages/home/home_page.dart';
import 'package:to_you_do/bloc_todo/todo_bloc.dart';
import 'package:to_you_do/constraints/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To You Do',
      theme: ThemeData(
        colorScheme: ColorScheme.light(
          background: AppColors().colorPalette300,
          onBackground: AppColors().colorPalette950,
          surface: AppColors().colorPalette050,
          onSurface: AppColors().colorPalette950,
          primary: AppColors().colorPalette400,
          onPrimary: AppColors().colorPalette950,
          secondary: AppColors().colorPalette200,
          onSecondary: AppColors().colorPalette950,
        ),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => TodoBloc()
          ..add(
            TodoStarted(),
          ),
        child: const HomePage(
          title: 'To You Do',
        ),
      ),
    );
  }
}
