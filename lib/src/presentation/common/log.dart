import 'dart:developer';

void logMessage({
  required bool isError,
  required String tag,
  required String message,
  String? error,
}) {
  // Solo ejecutará esto si está en modo debug
  assert(() {
    if (isError) {
      log("\x1B[31m🚫 Error in: $tag \x1B[0m\nMessage: $message\nError: $error");
    } else {
      log("\x1B[32m✔️ Message from: $tag \x1B[0m\nMessage: $message");
    }
    return true;
  }());
}
