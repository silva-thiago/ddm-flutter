import 'package:aponte_me/src/features/auth/interactor/atoms/atom_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/services/service_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';
import 'package:asp/asp.dart';

class ReduceAuth extends Reducer {
  final ServiceAuth serviceAuth;

  ReduceAuth(this.serviceAuth) {
    on(() => [checkAuthAction], _checkAuth);
    on(() => [loginWithEmailAction], _loginWithEmail);
    on(() => [logoutAction], _logout);
  }

  _checkAuth() {
    stateAuth.value = LoadingAuth();
    serviceAuth.checkAuth().then(stateAuth.setValue);
  }

  _loginWithEmail() {
    stateAuth.value = LoadingAuth();
    final dtoEmailCredential = loginWithEmailAction.value;
    serviceAuth.loginWithEmail(dtoEmailCredential).then(stateAuth.setValue);
  }

  _logout() {
    stateAuth.value = LoadingAuth();
    serviceAuth.logout().then(stateAuth.setValue);
  }
}
