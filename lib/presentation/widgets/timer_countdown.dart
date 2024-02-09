import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/core/utils/extensions.dart';

class TimerCountDown extends StatefulWidget {
  final int timeInMinutes;
  final int timeInSeconds;
  final int totalMinutes;
  final VoidCallback onPauseResumeTap;

  const TimerCountDown({
    super.key,
    required this.timeInMinutes,
    required this.timeInSeconds,
    required this.totalMinutes,
    required this.onPauseResumeTap,
  });

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown>
    with SingleTickerProviderStateMixin {
  var _paused = true;
  late Timer _timer;
  late final _dimensions =
      context.isTablet ? context.width * 0.65 : context.width * 0.8;

  // Remaining time in seconds
  late int _remainingTimeInSeconds = _totalTimeInSeconds;

  // Total time in seconds
  int get _totalTimeInSeconds =>
      widget.totalMinutes * 60 + widget.timeInSeconds;

  //  Calculate the progress of the timer (0.0 to 1.0) that updates every minute
  double get _calculatedProgress {
    if (_remainingTimeInSeconds == 0) return 0.0;
    return 1 - (_remainingTimeInSeconds / _totalTimeInSeconds);
  }

  void _updateRemainingTime() {
    if (_paused) return;
    if (_remainingTimeInSeconds > 0) {
      setState(() => _remainingTimeInSeconds--);
    } else {
      widget.onPauseResumeTap.call();
    }

    print('remaining time in _updateRemainingTime: $_remainingTimeInSeconds');
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(
        const Duration(seconds: 1), (_) => _updateRemainingTime());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() => _paused = !_paused);
          widget.onPauseResumeTap.call();
        },
        child: Container(
          width: _dimensions,
          height: _dimensions,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.only(top: context.height * 0.1),
          decoration: BoxDecoration(
            color: context.colorScheme.background,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: context.colorScheme.secondaryContainer.withOpacity(0.1),
                blurRadius: 20,
                offset: const Offset(-8, -16),
              ),
            ],
          ),
          child: Stack(
            children: [
              _buildOuterRing(),
              _buildInnerRing(),
              _buildContent(),
            ],
          ),
        ),
      );

  Widget _buildOuterRing() => Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.colorScheme.secondary,
              context.colorScheme.secondary.withOpacity(0.1),
            ],
            stops: const [0.25, 0.8],
          ),
        ),
      );

  Widget _buildInnerRing() => Container(
        margin: EdgeInsets.all(context.width * 0.05),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colorScheme.secondary,
        ),
        width: _dimensions - 16,
        height: _dimensions - 16,
        child: CircularProgressIndicator(
          value: _calculatedProgress,
          strokeCap: StrokeCap.round,
          valueColor: AlwaysStoppedAnimation(context.colorScheme.primary),
          backgroundColor: context.colorScheme.secondary.withOpacity(0.1),
          strokeWidth: 10,
        ),
      );

  Widget _buildContent() => Container(
        padding: EdgeInsets.all(context.width * 0.1),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.timeInMinutes}:${widget.timeInSeconds.toString().padLeft(2, '0')}',
              style: context.theme.textTheme.displayMedium
                  ?.copyWith(color: context.colorScheme.onSecondary),
            ),
            const SizedBox(height: 8),
            Text(
              (_paused ? 'Start' : 'Pause').toUpperCase(),
              style: context.theme.textTheme.headlineSmall
                  ?.copyWith(color: context.colorScheme.onSecondary),
            ),
          ],
        ),
      );
}
