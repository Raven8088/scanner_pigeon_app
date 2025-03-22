import 'package:flutter/material.dart';

class NavigatorService {
  static final NavigatorService _instance = NavigatorService._internal();

  factory NavigatorService() {
    return _instance;
  }

  NavigatorService._internal();

  static final GlobalKey<NavigatorState> navigatorkey =
      GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorkey.currentContext;

  Future<void> navigateTo(String routeName) {
    return navigatorkey.currentState!.pushNamed(routeName);
  }

  void goBack() {
    if (navigatorkey.currentState!.canPop()) {
      navigatorkey.currentState!.pop();
    }
  }
}

final navigatorService = NavigatorService();
