import 'package:flutter/material.dart';
import 'package:sacanner_pigeon_app/src/presentation/style/theme.dart';

import '../../services/navigator_service.dart';

class CustomColors {
  static Color? concavas =
      Theme.of(NavigatorService.navigatorkey.currentState!.context).canvasColor;
  static Color? background =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .background;
  static Color? primary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .primary;
  static Color? onPrimary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .onPrimary;
  static Color? secundary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .secondary;
  static Color? onSegundary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .onSecondary;
  static Color? tertiary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .tertiary;

  static Color? onPrimaryContainer =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .onPrimaryContainer;
  static Color? primaryContainer =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .primaryContainer;

  static Color? secondaryContainer =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .secondaryContainer;

  static Color? onInverseSurface =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .onInverseSurface;
  static Color? surface =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .surface;
  static Color? onSurface =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .onSurface;

  static Color? inversePrimary =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .inversePrimary;
  static Color? tertiaryContainer =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .tertiaryContainer;

  static Color? containerBackgroundDisable =
      Theme.of(NavigatorService.navigatorkey.currentState!.context)
          .colorScheme
          .tertiaryContainer;
  static Color? success = AppColors.success;
  static Color? error = AppColors.error;
}
