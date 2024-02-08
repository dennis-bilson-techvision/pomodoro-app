import 'package:flutter/material.dart';
import 'package:pomodoro/core/utils/extensions.dart';

class DurationPicker extends StatefulWidget {
  final void Function(int) onDurationChanged;
  final int? initialValue;

  const DurationPicker({
    super.key,
    required this.onDurationChanged,
    this.initialValue,
  });

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late var _durationInSeconds = widget.initialValue ?? 0;

  @override
  Widget build(BuildContext context) => Container(
        width: context.width * (context.isTablet ? 0.2 : 0.3),
        decoration: BoxDecoration(
          color: context.theme.disabledColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '$_durationInSeconds',
              style: context.theme.textTheme.labelLarge
                  ?.copyWith(color: context.colorScheme.onSurface),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    var updatedValue = ++_durationInSeconds;
                    setState(() => _durationInSeconds = updatedValue);
                    widget.onDurationChanged(updatedValue);
                  },
                  child: RotatedBox(
                    quarterTurns: 1,
                    child: Icon(Icons.chevron_left,
                        color: context.colorScheme.onSurface),
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    if (_durationInSeconds == 0) return;
                    var updatedValue = --_durationInSeconds;
                    setState(() => _durationInSeconds = updatedValue);
                    widget.onDurationChanged(updatedValue);
                  },
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Icon(Icons.chevron_left,
                        color: context.colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
