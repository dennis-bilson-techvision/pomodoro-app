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
// const _kLightGreyColor = Color(0xFFD7E0FF);
const _kDarkBackgroundColor = Color(0xFF161932);

/// endregion

/// region fonts
final kKumbhSans = _buildTextTheme(GoogleFonts.kumbhSansTextTheme());
final kRobotoSlab = _buildTextTheme(GoogleFonts.robotoSlabTextTheme());
final kSpaceMono = _buildTextTheme(GoogleFonts.spaceMonoTextTheme());

/// endregion

/// region app theme
ThemeData kOrangeTheme([TextTheme? textTheme]) => ThemeData(
      colorScheme:
          _buildColorScheme(primary: _kOrangeColor, onPrimary: _kWhiteColor),
      textTheme: _buildTextTheme(textTheme ?? kKumbhSans),
      scaffoldBackgroundColor: _kBackgroundColor,
      appBarTheme: _buildAppBarTheme(),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          backgroundColor: _kOrangeColor,
          foregroundColor: _kDarkBackgroundColor),
      disabledColor: _kGreyColor,
      dividerTheme: const DividerThemeData(color: _kDividerColor),
      iconTheme: const IconThemeData(color: _kBackgroundColor),
      dialogTheme: DialogTheme(
        backgroundColor: _kWhiteColor,
        titleTextStyle:
            kKumbhSans.titleMedium?.copyWith(color: _kBackgroundColor),
        contentTextStyle:
            kKumbhSans.bodyMedium?.copyWith(color: _kBackgroundColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      useMaterial3: false,
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
      disabledColor: _kGreyColor,
      dividerTheme: const DividerThemeData(color: _kDividerColor),
      iconTheme: const IconThemeData(color: _kBackgroundColor),
      dialogTheme: DialogTheme(
        backgroundColor: _kWhiteColor,
        titleTextStyle:
            kKumbhSans.titleMedium?.copyWith(color: _kBackgroundColor),
        contentTextStyle:
            kKumbhSans.bodyMedium?.copyWith(color: _kBackgroundColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      useMaterial3: false,
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
      disabledColor: _kGreyColor,
      dividerTheme: const DividerThemeData(color: _kDividerColor),
      iconTheme: const IconThemeData(color: _kBackgroundColor),
      dialogTheme: DialogTheme(
        backgroundColor: _kWhiteColor,
        titleTextStyle:
            kKumbhSans.titleMedium?.copyWith(color: _kBackgroundColor),
        contentTextStyle:
            kKumbhSans.bodyMedium?.copyWith(color: _kBackgroundColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      useMaterial3: false,
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
        fontSize: 96,
        fontWeight: FontWeight.w700,
        color: _kBackgroundColor,
      ),
      displayMedium: baseTheme.displayMedium?.copyWith(
        fontSize: 72,
        fontWeight: FontWeight.w900,
        color: _kBackgroundColor,
      ),
      displaySmall: baseTheme.displaySmall?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: _kBackgroundColor,
      ),
      headlineLarge: baseTheme.headlineLarge?.copyWith(
        fontWeight: FontWeight.w700,
        color: _kBackgroundColor,
      ),
      headlineMedium: baseTheme.headlineMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: _kBackgroundColor,
      ),
      headlineSmall: baseTheme.headlineSmall?.copyWith(
        fontSize: 15,
        letterSpacing: 4.23,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      titleLarge: baseTheme.titleLarge?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      titleMedium: baseTheme.titleMedium?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      bodyLarge: baseTheme.bodyLarge?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      bodyMedium: baseTheme.bodyMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      labelLarge: baseTheme.labelLarge?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: _kBackgroundColor,
      ),
      labelMedium: baseTheme.labelMedium?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w700,
        color: _kBackgroundColor,
      ),
      bodySmall: baseTheme.bodySmall?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: _kBackgroundColor,
      ),
      labelSmall: baseTheme.labelSmall?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: _kBackgroundColor,
      ),
    );

// define the color scheme
ColorScheme _buildColorScheme({
  Color primary = _kOrangeColor,
  Color secondary = _kDarkBackgroundColor,
  Color background = _kBackgroundColor,
  Color surface = _kWhiteColor,
  Color onPrimary = _kDarkBackgroundColor,
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
      secondaryContainer: const Color(0xff2e32fe),
    );

/// endregion
