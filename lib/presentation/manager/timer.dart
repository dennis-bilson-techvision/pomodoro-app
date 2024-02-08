import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'timer.g.dart';

final class TimerConfig {
  const TimerConfig({
    required this.pomodoro,
    required this.shortBreak,
    required this.longBreak,
  });

  final int pomodoro;
  final int shortBreak;
  final int longBreak;

  TimerConfig copyWith({
    int? pomodoro,
    int? shortBreak,
    int? longBreak,
  }) =>
      TimerConfig(
        pomodoro: pomodoro ?? this.pomodoro,
        shortBreak: shortBreak ?? this.shortBreak,
        longBreak: longBreak ?? this.longBreak,
      );
}

@Riverpod(keepAlive: true)
class TimerConfigBuilder extends _$TimerConfigBuilder {
  TimerConfigBuilder() : super();

  @override
  TimerConfig build() {
    state = const TimerConfig(
      pomodoro: 25,
      shortBreak: 5,
      longBreak: 15,
    );
    return state;
  }

  void setPomodoro(int? minutes) {
    state = state.copyWith(pomodoro: minutes);
  }

  void setShortBreak(int? minutes) {
    state = state.copyWith(shortBreak: minutes);
  }

  void setLongBreak(int? minutes) {
    state = state.copyWith(longBreak: minutes);
  }
}
