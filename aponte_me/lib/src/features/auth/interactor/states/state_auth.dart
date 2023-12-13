import 'package:aponte_me/src/features/auth/interactor/entities/entity_tokenization.dart';

sealed class StateAuth {}

class InitialAuth implements StateAuth {}

class LoadingAuth implements StateAuth {}

class Authenticated implements StateAuth {
  final EntityTokenization token;

  Authenticated(this.token);
}

class Unauthenticated implements StateAuth {}
