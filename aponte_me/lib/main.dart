import 'package:aponte_me/app/pages/onboarding/onboarding_page.dart';
import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:aponte_me/theme/dynamic_color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? seenOnboard;

class ProviderTheme extends ChangeNotifier {
  bool activateDarkMode = false;

  void toggleTheme() {
    activateDarkMode = !activateDarkMode;
    notifyListeners();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [
      SystemUiOverlay.top,
      SystemUiOverlay.bottom,
    ],
  );

  SharedPreferences preferences = await SharedPreferences.getInstance();
  seenOnboard = preferences.getBool('seenOnboard') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProviderTheme(),
        ),
        /*ChangeNotifierProvider(
          create: (_) => ProviderContactEmergency(),
        ),*/
      ],
      builder: (context, child) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
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
            home: seenOnboard == true
                ? const SignInPage()
                : const OnboardingPage());
      },
    ),
  );
}
