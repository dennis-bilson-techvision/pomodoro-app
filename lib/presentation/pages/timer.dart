import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/utils/constants.dart';
import 'package:pomodoro/core/utils/extensions.dart';
import 'package:pomodoro/presentation/manager/timer.dart';
import 'package:pomodoro/presentation/widgets/dialogs.dart';
import 'package:pomodoro/presentation/widgets/pilled_tab.dart';
import 'package:pomodoro/presentation/widgets/timer_countdown.dart';

/// TimerPage is the main page for the Pomodoro app.
/// It displays 3 tabs for the user to select from: Pomodoro, Short, Long timers
class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends ConsumerState<TimerPage>
    with TickerProviderStateMixin {
  final _timerInterval = const Duration(seconds: 1);
  final _labels = ['Pomodoro', 'Short Break', 'Long Break'];
  var _selectedIndex = 0, _timeInMinutes = 0, _timeInSeconds = 0;
  Timer? _timer;

  /// Handle the tab selection
  void _onSelected(int index) {
    switch (index) {
      case 0:
        _timeInMinutes = ref.read(timerConfigBuilderProvider).pomodoro;
        break;
      case 1:
        _timeInMinutes = ref.read(timerConfigBuilderProvider).shortBreak;
        break;
      case 2:
        _timeInMinutes = ref.read(timerConfigBuilderProvider).longBreak;
        break;
    }
    setState(() => _selectedIndex = index);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _setupTimer();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(kAppName)),
        body: Column(
          children: [
            SizedBox(height: context.height * 0.05),

            /// tabs
            PilledTab(
                labels: _labels,
                selectedIndex: _selectedIndex,
                onSelected: _onSelected),
            TimerCountDown(
              timeInMinutes: _timeInMinutes,
              timeInSeconds: _timeInSeconds,
              onPauseResumeTap: () =>
                  _timer?.isActive == true ? _timer?.cancel() : _startTimer(),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: IconButton(
          onPressed: () => showSettingsDialog(ref),
          tooltip: 'View settings',
          icon: const Icon(Icons.settings),
          iconSize: 28,
          color: context.colorScheme.onBackground,
        ),
      );

  /// Setup the timer to countdown
  Future<void> _setupTimer() async {
    ref.listenManual(timerConfigBuilderProvider, (previous, next) {
      print('previous: $previous, next: $next');
      if (previous == next) return;
      switch (_selectedIndex) {
        case 0:
          _timeInMinutes = next.pomodoro;
          break;
        case 1:
          _timeInMinutes = next.shortBreak;
          break;
        case 2:
          _timeInMinutes = next.longBreak;
          break;
      }

      // restart the timer when the value changes
      _startTimer();
    });
  }

  /// Start the timer
  void _startTimer() async {
    _timer?.cancel();
    _timer = Timer.periodic(
        _timerInterval,
        (timer) => setState(() {
              if (_timeInSeconds > 0) {
                _timeInSeconds--;
              } else {
                if (_timeInMinutes > 0) {
                  _timeInMinutes--;
                  _timeInSeconds = 59;
                } else {
                  _timer?.cancel();
                }
              }
            }));
  }
}
