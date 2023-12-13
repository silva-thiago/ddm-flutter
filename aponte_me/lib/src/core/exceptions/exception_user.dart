abstract class ExceptionUser implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const ExceptionUser(this.message, [this.stackTrace]);

  @override
  String toString() {
    var traceText = '';
    if (stackTrace != null) {
      traceText = '\n$stackTrace';
    }
    return '$runtimeType: $message$traceText';
  }
}
