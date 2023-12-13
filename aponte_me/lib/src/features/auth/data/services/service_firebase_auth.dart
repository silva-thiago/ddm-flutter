import 'package:aponte_me/src/features/auth/interactor/dtos/dto_email_credential.dart';
import 'package:aponte_me/src/features/auth/interactor/entities/entity_tokenization.dart';
import 'package:aponte_me/src/features/auth/interactor/services/service_auth.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ServiceFirebaseAuth extends ServiceAuth {
  final FirebaseAuth firebaseAuth;

  ServiceFirebaseAuth(this.firebaseAuth);

  @override
  Future<StateAuth> checkAuth() async {
    final token = await firebaseAuth.currentUser?.getIdToken();
    if (token == null) {
      return Unauthenticated();
    } else {
      final tokenization = EntityTokenization(idToken: token);
      return Authenticated(tokenization);
    }
  }

  @override
  Future<StateAuth> loginWithEmail(
      DTOEmailCredential dtoEmailCredential) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: dtoEmailCredential.email,
        password: dtoEmailCredential.password,
      );
      return checkAuth();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return Unauthenticated();
      } else if (e.code == 'wrong-password') {
        return Unauthenticated();
      }
      rethrow;
    } catch (e) {
      Unauthenticated();
    }

    return Unauthenticated();
  }

  @override
  Future<StateAuth> logout() async {
    await firebaseAuth.signOut();

    return Unauthenticated();
  }
}
