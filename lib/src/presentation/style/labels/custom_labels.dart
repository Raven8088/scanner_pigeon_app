import 'package:flutter/material.dart';

import '../../services/navigator_service.dart';

class CustomLabels {
  static TextStyle? h1 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .displayLarge; //28

  static TextStyle? h2 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .displayMedium; //24

  static TextStyle? h3 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .displaySmall; //22
  static TextStyle? h4 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .headlineMedium!; //20

  static TextStyle? h5 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .headlineSmall; //17

  static TextStyle? h6 = Theme.of(NavigatorService.navigatorkey.currentContext!)
      .textTheme
      .titleLarge; //16

  static TextStyle? bodyText1 =
      Theme.of(NavigatorService.navigatorkey.currentContext!)
          .textTheme
          .bodyLarge; //16
  static TextStyle? bodyText2 =
      Theme.of(NavigatorService.navigatorkey.currentContext!)
          .textTheme
          .bodyMedium; //17

  static TextStyle? overline =
      Theme.of(NavigatorService.navigatorkey.currentContext!)
          .textTheme
          .labelSmall; //14
  static TextStyle? caption =
      Theme.of(NavigatorService.navigatorkey.currentContext!)
          .textTheme
          .bodySmall; //14
  static TextStyle? bottom =
      Theme.of(NavigatorService.navigatorkey.currentContext!)
          .textTheme
          .labelLarge; //16
}

///
