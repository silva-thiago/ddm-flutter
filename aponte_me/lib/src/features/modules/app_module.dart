import 'package:aponte_me/app/pages/dashboard/dashboard_page.dart';
import 'package:aponte_me/app/pages/onboarding/onboarding_page.dart';
import 'package:aponte_me/app/pages/sing_in/sign_in_page.dart';
import 'package:aponte_me/src/features/auth/module_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [ModuleAuth()];

  @override
  void binds(Injector i) {
    // i.add(ServiceFirebaseAuth.new);
    i.add(() => FirebaseAuth.instance);
  }

  @override
  void routes(RouteManager r) {
    r.child("/", child: (_) => const OnboardingPage());
    r.child("/sign-in", child: (_) => const SignInPage());
    r.child("/dashboard", child: (_) => const DashboardPage());
  }
}
