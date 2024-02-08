import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// region colors
const _kOrangeColor = Color(0xFFF87070);
const _kPurpleColor = Color(0xFFD881F8);
const _kGreenColor = Color(0xFF70F3F8);
const _kBackgroundColor = Color(0xFF1E213F);
const _kWhiteColor = Color(0xFFFFFFFF);
const _kGreyColor = Color(0xFFEFF1FA);
const _kDividerColor = Color(0xFFE3E1E1);
const _kLightGreyColor = Color(0xFFD7E0FF);
const _kDarkBackgroundColor = Color(0xFF161932);

/// endregion

/// region fonts
final kKumbhSans = _buildTextTheme(GoogleFonts.kumbhSansTextTheme());
final kRobotoSlab = _buildTextTheme(GoogleFonts.robotoSlabTextTheme());
final kSpaceMono = _buildTextTheme(GoogleFonts.spaceMonoTextTheme());

/// endregion

/// region app theme
ThemeData kOrangeTheme([TextTheme? textTheme]) => ThemeData(
      colorScheme: _buildColorScheme(
          primary: _kOrangeColor, onPrimary: _kDarkBackgroundColor),
      textTheme: _buildTextTheme(textTheme ?? kKumbhSans),
      scaffoldBackgroundColor: _kBackgroundColor,
      appBarTheme: _buildAppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: _kOrangeColor,
          foregroundColor: _kDarkBackgroundColor),
      dividerTheme: const DividerThemeData(color: _kDividerColor),
      useMaterial3: true,
    );

ThemeData kPurpleTheme([TextTheme? textTheme]) => ThemeData(
      colorScheme: _buildColorScheme(
          primary: _kPurpleColor, onPrimary: _kDarkBackgroundColor),
      textTheme: _buildTextTheme(textTheme ?? kKumbhSans),
      scaffoldBackgroundColor: _kBackgroundColor,
      appBarTheme: _buildAppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: _kPurpleColor,
          foregroundColor: _kDarkBackgroundColor),
      useMaterial3: true,
    );

ThemeData kGreenTheme([TextTheme? textTheme]) => ThemeData(
      colorScheme: _buildColorScheme(
          primary: _kGreenColor, onPrimary: _kDarkBackgroundColor),
      textTheme: _buildTextTheme(textTheme ?? kKumbhSans),
      scaffoldBackgroundColor: _kBackgroundColor,
      appBarTheme: _buildAppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: _kGreenColor,
          foregroundColor: _kDarkBackgroundColor),
      useMaterial3: true,
    );

AppBarTheme _buildAppBarTheme([TextTheme? baseTextTheme]) => AppBarTheme(
      backgroundColor: _kBackgroundColor,
      elevation: 0,
      titleTextStyle: (baseTextTheme ?? kKumbhSans)
          .displaySmall
          ?.copyWith(color: _kWhiteColor),
      iconTheme: const IconThemeData(color: _kWhiteColor),
    );

TextTheme _buildTextTheme(TextTheme baseTheme) => baseTheme.copyWith(
      displayLarge: baseTheme.displayLarge?.copyWith(
        fontSize: 120,
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      displayMedium: baseTheme.displayMedium?.copyWith(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      displaySmall: baseTheme.displaySmall?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      headlineLarge: baseTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      headlineMedium: baseTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      headlineSmall: baseTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      titleLarge: baseTheme.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _kWhiteColor,
      ),
      bodyLarge: baseTheme.bodyLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _kWhiteColor,
      ),
      bodyMedium: baseTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: _kWhiteColor,
      ),
      labelLarge: baseTheme.labelLarge?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: _kWhiteColor,
      ),
      bodySmall: baseTheme.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: _kWhiteColor,
      ),
      labelSmall: baseTheme.labelSmall?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: _kWhiteColor,
      ),
    );

// define the color scheme
ColorScheme _buildColorScheme({
  Color primary = _kOrangeColor,
  Color secondary = _kPurpleColor,
  Color background = _kBackgroundColor,
  Color surface = _kWhiteColor,
  Color onPrimary = _kWhiteColor,
  Color onSecondary = _kWhiteColor,
  Color onBackground = _kWhiteColor,
  Color onSurface = _kDarkBackgroundColor,
  Color onError = _kWhiteColor,
}) =>
    ColorScheme.light(
      background: background,
      onBackground: onBackground,
      primary: primary,
      onPrimary: onPrimary,
      secondary: secondary,
      onSecondary: onSecondary,
      surface: surface,
      onSurface: onSurface,
      onError: onError,
    );

/// endregion
