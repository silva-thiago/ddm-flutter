import 'package:aponte_me/src/features/auth/data/services/service_firebase_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/reducers/reducer_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/services/service_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class GlobalAuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.add<FirebaseAuth>(() => FirebaseAuth.instance);
    i.add<ServiceAuth>(ServiceFirebaseAuth.new);
    i.addSingleton(ReduceAuth.new);
  }
}

class ModuleAuth extends Module {
  @override
  List<Module> get imports => [GlobalAuthModule()];

  @override
  void binds(Injector i) {
    i.add<FirebaseAuth>(() => FirebaseAuth.instance);
    i.add<ServiceAuth>(ServiceFirebaseAuth.new);
  }

  @override
  void routes(RouteManager r) {
    r.module("/auth", module: ModuleAuth());
  }
}
