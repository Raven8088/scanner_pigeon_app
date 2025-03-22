import 'package:flutter/cupertino.dart';

import 'navigator_service.dart';

class NavigationService {
  final String newRoute;
  const NavigationService({required this.newRoute});

  pushRedirect({Object? arguments}) {
    Navigator.pushNamed(NavigatorService.navigatorkey.currentContext!, newRoute,
        arguments: arguments ?? []);
  }

  pushRename() {
    Navigator.pushReplacementNamed(
        NavigatorService.navigatorkey.currentContext!, newRoute);
  }

  void pushAndRemoveUntil() {
    Navigator.pushNamedAndRemoveUntil(
      NavigatorService.navigatorkey.currentContext!,
      newRoute,
      (route) => false, // Elimina todas las rutas previas
    );
  }
}
