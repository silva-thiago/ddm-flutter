import 'package:aponte_me/src/features/auth/interactor/atoms/atom_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500)).whenComplete(
      checkAuthAction.call,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('AponteMe'),
      ),
    );
  }
}
