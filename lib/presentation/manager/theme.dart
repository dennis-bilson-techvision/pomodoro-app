import 'package:flutter/material.dart';
import 'package:pomodoro/core/app/theme.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

enum AppThemePref { orange, purple, green }

enum TextThemePref { kumbhSans, robotoSlab, spaceMono }

/// [AppThemeBuilder] is a Riverpod provider that builds the current theme
/// based on the current color & font preferences
@Riverpod(keepAlive: true)
class AppThemeBuilder extends _$AppThemeBuilder {
  AppThemeBuilder() : super();

  @override
  ThemeData build() {
    state = kOrangeTheme();
    return state;
  }

  /// [getPreferredTheme] is a method that returns the current theme preference
  TextThemePref getPreferredTextTheme() =>
      state.textTheme.bodyLarge?.fontFamily == kRobotoSlab.bodyLarge?.fontFamily
          ? TextThemePref.robotoSlab
          : state.textTheme.bodyLarge?.fontFamily ==
                  kSpaceMono.bodyLarge?.fontFamily
              ? TextThemePref.spaceMono
              : TextThemePref.kumbhSans;

  /// [switchTheme] is a method that switches the current theme
  void switchTheme(AppThemePref themePref) {
    switch (themePref) {
      case AppThemePref.purple:
        state = kPurpleTheme(state.textTheme);
        break;
      case AppThemePref.green:
        state = kGreenTheme(state.textTheme);
        break;
      default:
        state = kOrangeTheme(state.textTheme);
        break;
    }
  }

  /// [switchTextTheme] is a method that switches the current text theme
  void switchTextTheme(TextThemePref ttPref) {
    switch (ttPref) {
      case TextThemePref.robotoSlab:
        state = state.copyWith(
          textTheme: kRobotoSlab,
          appBarTheme: state.appBarTheme.copyWith(
              foregroundColor: state.colorScheme.onBackground,
              titleTextStyle: kRobotoSlab.titleLarge
                  ?.copyWith(color: state.colorScheme.onBackground)),
        );
        break;
      case TextThemePref.spaceMono:
        state = state.copyWith(
          textTheme: kSpaceMono,
          appBarTheme: state.appBarTheme.copyWith(
              foregroundColor: state.colorScheme.onBackground,
              titleTextStyle: kSpaceMono.titleLarge
                  ?.copyWith(color: state.colorScheme.onBackground)),
        );
        break;
      default:
        state = state.copyWith(
          textTheme: kKumbhSans,
          appBarTheme: state.appBarTheme.copyWith(
              foregroundColor: state.colorScheme.onBackground,
              titleTextStyle: kKumbhSans.titleLarge
                  ?.copyWith(color: state.colorScheme.onBackground)),
        );
        break;
    }
  }
}
