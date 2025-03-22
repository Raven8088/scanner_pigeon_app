import 'package:sacanner_pigeon_app/src/ui/login/login_page.dart';
import 'package:sacanner_pigeon_app/src/ui/spash/splash_page.dart';

import '../ui/scanner/qr_scanner_page.dart';
import '../ui/scanner/scanner_page.dart';

class Routes {
  static var routes = {
    '/': (context) => const SplashPage(), //SplashPage,
    '/LoginPage': (context) => const LoginPage(), //LoginPage,
    '/ScannerPage': (context) => const ScannerPage(), //ScannerPage,
    '/QrScannerPage': (context) => const QrScannerPage(), //QrScannerPage,
  };
}
