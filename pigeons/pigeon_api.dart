import 'package:pigeon/pigeon.dart';

class BiometricAuthResponse {
  bool? success;
  String? errorMessage;
}

@HostApi()
abstract class BiometricAuthApi {
  @async
  BiometricAuthResponse authenticate();
}
