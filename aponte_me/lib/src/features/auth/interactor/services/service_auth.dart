import 'package:aponte_me/src/features/auth/interactor/dtos/dto_email_credential.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';

abstract class ServiceAuth {
  Future<StateAuth> loginWithEmail(DTOEmailCredential dtoEmailCredential);

  // Future<String> register(String email, String password);

  Future<StateAuth> logout();

  // Future<bool> isLogged();

  Future<StateAuth> checkAuth();

// Future<String> getUser();
}
