import 'package:aponte_me/src/features/auth/interactor/atoms/atom_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';
import 'package:aponte_me/theme/dynamic_color_schemes.g.dart';
import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    rxObserver(
      () => stateAuth.value,
      effect: (state) {
        if (state is Unauthenticated) {
          Modular.to.navigate('/sign-in');
        } else if (state is Authenticated) {
          Modular.to.navigate('/dashboard');
        } else if (state is LoadingAuth) {
          Modular.to.navigate('/sign-in');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: Modular.routerConfig,
      title: 'AponteMe',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            lightColorScheme.primary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: lightColorScheme.primary,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            foregroundColor: lightColorScheme.onPrimary,
            backgroundColor: lightColorScheme.primary,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: lightColorScheme.primary,
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all<Color>(
            darkColorScheme.primary,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: darkColorScheme.primary,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            foregroundColor: darkColorScheme.onPrimary,
            backgroundColor: darkColorScheme.primary,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: darkColorScheme.primary,
            textStyle: const TextStyle(
              fontSize: 20.0,
              inherit: false,
            ),
          ),
        ),
      ),
      /*home: seenOnboard == true
                  ? const SignInPage()
                  : const OnboardingPage(),*/
    );
  }
}
