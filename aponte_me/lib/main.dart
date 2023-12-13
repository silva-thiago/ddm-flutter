import 'package:aponte_me/app/app_widget.dart';
import 'package:aponte_me/firebase_options.dart';
import 'package:aponte_me/src/features/modules/app_module.dart';
import 'package:asp/asp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    RxRoot(
      child: ModularApp(
        module: AppModule(),
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => ProviderTheme(),
            ),
          ],
          builder: (context, child) {
            /*Modular.get<ProviderTheme>().activateDarkMode =
                preferences.getBool('activateDarkMode') ?? false;*/
            Modular.setInitialRoute(seenOnboard == true ? '/' : '/sign-in');
            return const AppWidget();
          },
        ),
      ),
    ),
  );
}
