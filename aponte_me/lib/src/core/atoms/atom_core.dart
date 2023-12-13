import 'package:aponte_me/src/core/exceptions/exception_user.dart';
import 'package:asp/asp.dart';

final globalLoadingState = Atom<bool>(false, key: 'globalLoadingState');

final globalExceptionState = Atom<ExceptionUser?>(
  null,
  key: 'globalExceptionState',
  pipe: interval(const Duration(seconds: 1)),
);
