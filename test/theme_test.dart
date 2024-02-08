import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/presentation/manager/theme.dart';

import 'provider_container.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('AppThemeBuilder', () {
    // test('switches the current theme', () {
    //   final builder = createContainer(
    //     overrides: [
    //       appThemeBuilderProvider.overrideWith(() => AppThemeBuilder()),
    //     ],
    //   );
    //   builder
    //       .read(appThemeBuilderProvider.notifier)
    //       .switchTheme(AppThemePref.green);
    //
    //   expect(
    //       builder.read(appThemeBuilderProvider.notifier).getPreferredAppTheme(),
    //       AppThemePref.green);
    // });

    test('switches the current text theme', () {
      final builder = createContainer(
        overrides: [
          appThemeBuilderProvider.overrideWith(() => AppThemeBuilder()),
        ],
      );
      builder
          .read(appThemeBuilderProvider.notifier)
          .switchTextTheme(TextThemePref.spaceMono);

      expect(
          builder
              .read(appThemeBuilderProvider.notifier)
              .getPreferredTextTheme(),
          TextThemePref.spaceMono);
    });
  });
}
