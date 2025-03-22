import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  static const primary = Color(0xFFFBB03B);
  static const onPrimary = Color(0xFF1B161C);
  static const segundary = Color(0xFFFFFFFF);
  static const onSegundary = Color(0xFF1B161C);
  static const tertiary = Color(0xFFB3B3B3);
  static const backGround = Color(0xFFE5E5E5);
  static const containerBackgroundDisable = Color(0xFFDEDEDE);

  ///////////////////////////////////////////////////
  static const onBackground = Color(0xFF003738);
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const gray = Color(0xFF8D8B8E);
  static const grayDisable = Color(0xFF909FA2);
  static const grayDisableBtn = Color(0xFF555555);
  static const lightGray = Color(0xFFD9D9D9);
  static const error = Color(0xFFFD494A);
  static const shadow = Color(0xFFF5F8F8);
  static const shadow2 = Color(0xFFE5E5E5);

  static const transparent = Colors.transparent;
  static const primaryContainer = Color(0xFFFDFDFF);
  static const onPrimaryContainer = Color(0xFF59A7BD);
  static const success = Color(0xFF00CE78);
  static const inversePrimary = Color(0xFF6D7583);
  static const tertiaryContainer = Color(0xFFF0F0F0);
}

ThemeData lightTheme({BuildContext? context}) {
  //double btnRadioDefault = 15;
//
  TextTheme textThemeLight = TextTheme(
    displayLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    displayMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    displaySmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    headlineMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    headlineSmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    titleLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.onSegundary),
    bodyLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.onSegundary),
    bodyMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: AppColors.onSegundary),
    labelSmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.onSegundary),
    labelLarge: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16,
        color: AppColors.onSegundary),
    bodySmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.onSegundary),
    titleMedium: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: AppColors.onSegundary),
    titleSmall: TextStyle(
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: AppColors.onSegundary),
  );
  InputDecorationTheme inputTemeLight = const InputDecorationTheme(
      enabledBorder: UnderlineInputBorder(),
      errorBorder: OutlineInputBorder(),
      focusedBorder: UnderlineInputBorder(),
      focusedErrorBorder: UnderlineInputBorder(),
      disabledBorder: UnderlineInputBorder());
  AppBarTheme appBarLightTheme = const AppBarTheme(
    color: AppColors.segundary,
    shadowColor: AppColors.onSegundary,
    iconTheme: IconThemeData(color: AppColors.black),
    scrolledUnderElevation: 0.3,
    titleSpacing: 0,
    surfaceTintColor: AppColors.segundary,
    elevation: 0.3,
  );

  return ThemeData(
      inputDecorationTheme: inputTemeLight,

      // elevatedButtonTheme: elevatedButtonThemeData,
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: AppColors.segundary,
      cardColor: AppColors.segundary,
      colorScheme: const ColorScheme(
          onInverseSurface: AppColors.lightGray,
          primary: AppColors.primary,
          onPrimary: AppColors.black,
          secondary: AppColors.segundary,
          onSecondary: AppColors.onSegundary,
          tertiary: AppColors.tertiary,
          surface: AppColors.gray,
          onSurface: AppColors.grayDisable,
          brightness: Brightness.light,
          error: AppColors.error,
          onError: AppColors.error,
          primaryContainer: AppColors.primaryContainer,
          onPrimaryContainer: AppColors.onPrimaryContainer,
          secondaryContainer: AppColors.success,
          inversePrimary: AppColors.inversePrimary,
          tertiaryContainer: AppColors.containerBackgroundDisable),
      iconTheme: const IconThemeData(color: Colors.red),
      appBarTheme: appBarLightTheme,
      scaffoldBackgroundColor: AppColors.segundary,
      shadowColor: AppColors.white,
      textTheme: textThemeLight);
}
//
