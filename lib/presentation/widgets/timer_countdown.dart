import 'package:flutter/material.dart';
import 'package:pomodoro/core/utils/extensions.dart';

class TimerCountDown extends StatefulWidget {
  final int timeInMinutes;
  final VoidCallback onPauseResumeTap;

  const TimerCountDown({
    super.key,
    required this.timeInMinutes,
    required this.onPauseResumeTap,
  });

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  var _paused = false;

  @override
  Widget build(BuildContext context) => Container(
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
          // @todo -> animate this value and make it dynamic
          value: 0.85,
          strokeCap: StrokeCap.round,
          valueColor: AlwaysStoppedAnimation(context.colorScheme.primary),
          backgroundColor: context.colorScheme.secondary.withOpacity(0.1),
          strokeWidth: 10,
        ),
      );

  // @todo -> finish UI content
  Widget _buildContent() => GestureDetector(
        onTap: () {
          setState(() => _paused = !_paused);
          widget.onPauseResumeTap.call();
        },
        child: Container(
          padding: EdgeInsets.all(context.width * 0.1),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '${widget.timeInMinutes}:00',
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
        ),
      );
}
