import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/core/utils/extensions.dart';

class TimerCountDown extends StatefulWidget {
  final int timeInMinutes;
  final int timeInSeconds;
  final VoidCallback onPauseResumeTap;

  const TimerCountDown({
    super.key,
    required this.timeInMinutes,
    required this.timeInSeconds,
    required this.onPauseResumeTap,
  });

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown>
    with SingleTickerProviderStateMixin {
  var _paused = false;
  late Timer _timer;

  // Total time in seconds
  int get _totalTimeInSeconds =>
      widget.timeInMinutes * 60 + widget.timeInSeconds;

  // Remaining time in seconds
  late int _remainingTimeInSeconds;

  //  Calculate the progress of the timer (0.0 to 1.0) that updates every minute
  double get _calculatedProgress => _totalTimeInSeconds == 0
      ? 0
      : 1 - (_remainingTimeInSeconds / _totalTimeInSeconds);

  void _updateRemainingTime() {
    if (_paused || _remainingTimeInSeconds == 0) return;
    if (_remainingTimeInSeconds > 0) {
      setState(() => _remainingTimeInSeconds--);
    } else {
      widget.onPauseResumeTap.call();
    }

    print('remaining time: $_remainingTimeInSeconds');
  }

  @override
  void initState() {
    super.initState();
    _remainingTimeInSeconds = _totalTimeInSeconds;
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
          width: context.width * 0.8,
          height: context.width * 0.8,
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
        width: context.width * 0.7,
        height: context.width * 0.7,
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
              (_paused ? 'Pause' : 'Start').toUpperCase(),
              style: context.theme.textTheme.headlineSmall
                  ?.copyWith(color: context.colorScheme.onSecondary),
            ),
          ],
        ),
      );
}
