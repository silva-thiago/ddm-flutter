import 'package:aponte_me/src/features/auth/interactor/dtos/dto_email_credential.dart';
import 'package:aponte_me/src/features/auth/interactor/states/state_auth.dart';
import 'package:asp/asp.dart';

final stateAuth = Atom<StateAuth>(
  InitialAuth(),
  key: 'StateAuth',
);

final checkAuthAction = Atom.action(key: 'checkAuthAction');

final loginWithEmailAction = Atom<DTOEmailCredential>(
  DTOEmailCredential(),
  key: 'loginWithEmailAction',
);

final logoutAction = Atom.action(key: 'logoutAction');
