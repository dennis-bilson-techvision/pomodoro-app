import 'package:flutter_test/flutter_test.dart';
import 'package:pomodoro/presentation/manager/timer.dart';

import 'provider_container.dart';

void main() {
  group('TimerConfig', () {
    test('creates a TimerConfig with given values', () {
      const config = TimerConfig(pomodoro: 25, shortBreak: 5, longBreak: 15);

      expect(config.pomodoro, 25);
      expect(config.shortBreak, 5);
      expect(config.longBreak, 15);
    });

    test('creates a copy of TimerConfig with updated values', () {
      const config = TimerConfig(pomodoro: 25, shortBreak: 5, longBreak: 15);
      final updatedConfig = config.copyWith(pomodoro: 30);

      expect(updatedConfig.pomodoro, 30);
      expect(updatedConfig.shortBreak, 5);
      expect(updatedConfig.longBreak, 15);
    });
  });

  group('TimerConfigBuilder', () {
    test('builds a TimerConfig with default values', () {
      var provider = createContainer(
        overrides: [
          timerConfigBuilderProvider.overrideWith(() => TimerConfigBuilder()),
        ],
      );
      var config = provider.read(timerConfigBuilderProvider);
      expect(config.pomodoro, 25);
      expect(config.shortBreak, 5);
      expect(config.longBreak, 15);
    });

    test('updates pomodoro value in TimerConfig', () {
      var provider = createContainer(
        overrides: [
          timerConfigBuilderProvider.overrideWith(() => TimerConfigBuilder()),
        ],
      );
      provider.read(timerConfigBuilderProvider.notifier).setPomodoro(30);

      expect(provider.read(timerConfigBuilderProvider).pomodoro, 30);
    });

    test('updates shortBreak value in TimerConfig', () {
      var provider = createContainer(
        overrides: [
          timerConfigBuilderProvider.overrideWith(() => TimerConfigBuilder()),
        ],
      );
      provider.read(timerConfigBuilderProvider.notifier).setShortBreak(10);

      expect(provider.read(timerConfigBuilderProvider).shortBreak, 10);
    });

    test('updates longBreak value in TimerConfig', () {
      var provider = createContainer(
        overrides: [
          timerConfigBuilderProvider.overrideWith(() => TimerConfigBuilder()),
        ],
      );
      provider.read(timerConfigBuilderProvider.notifier).setLongBreak(20);

      expect(provider.read(timerConfigBuilderProvider).longBreak, 20);
    });
  });
}
