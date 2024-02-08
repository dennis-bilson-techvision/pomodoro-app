import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/app/theme.dart';
import 'package:pomodoro/core/utils/extensions.dart';
import 'package:pomodoro/presentation/manager/theme.dart';
import 'package:pomodoro/presentation/manager/timer.dart';

Future<void> showSettingsDialog(WidgetRef ref) async {
  var context = ref.context;
  var themeProvider = ref.read(appThemeBuilderProvider.notifier);

  void switchTheme(AppThemePref themePref) {
    themeProvider.switchTheme(themePref);
    context.navigator.pop();
  }

  void switchTextTheme(TextThemePref ttPref) {
    themeProvider.switchTextTheme(ttPref);
    context.navigator.pop();
  }

  await showDialog(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
      backgroundColor: context.colorScheme.surface,
      content: SizedBox(
        width: context.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Settings',
                  style: context.theme.textTheme.bodyLarge
                      ?.copyWith(color: context.colorScheme.onSurface),
                ),
                IconButton(
                    onPressed: context.navigator.pop,
                    icon: const Icon(Icons.close),
                    tooltip: 'Close',
                    color: context.colorScheme.onSurface),
              ],
            ),
            const Divider(height: 8, thickness: 1),
            const SizedBox(height: 12),
            Text(
              'Time (Minutes)'.toUpperCase(),
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTimerConfigTile(
              ctx,
              label: 'pomodoro',
              value: ref.read(timerConfigBuilderProvider).pomodoro,
              onChanged: (value) => ref
                  .read(timerConfigBuilderProvider.notifier)
                  .setPomodoro(value),
            ),
            _buildTimerConfigTile(
              ctx,
              label: 'short break',
              value: ref.read(timerConfigBuilderProvider).shortBreak,
              onChanged: (value) => ref
                  .read(timerConfigBuilderProvider.notifier)
                  .setShortBreak(value),
            ),
            _buildTimerConfigTile(
              ctx,
              label: 'long break',
              value: ref.read(timerConfigBuilderProvider).longBreak,
              onChanged: (value) => ref
                  .read(timerConfigBuilderProvider.notifier)
                  .setLongBreak(value),
            ),
            const SizedBox(height: 24),
            Text(
              'Font'.toUpperCase(),
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildFontPickerTile(ref,
                    label: 'Kumbh Sans',
                    value: TextThemePref.kumbhSans,
                    onChanged: switchTextTheme),
                _buildFontPickerTile(ref,
                    label: 'Roboto Slab',
                    value: TextThemePref.robotoSlab,
                    onChanged: switchTextTheme),
                _buildFontPickerTile(ref,
                    label: 'Space Mono',
                    value: TextThemePref.spaceMono,
                    onChanged: switchTextTheme),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Color'.toUpperCase(),
              style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.onSurface,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildColorPickerTile(ref,
                    value: kOrangeTheme().colorScheme.primary,
                    onChanged: (color) => switchTheme(AppThemePref.orange)),
                _buildColorPickerTile(ref,
                    value: kGreenTheme().colorScheme.primary,
                    onChanged: (color) => switchTheme(AppThemePref.green)),
                _buildColorPickerTile(ref,
                    value: kPurpleTheme().colorScheme.primary,
                    onChanged: (color) => switchTheme(AppThemePref.purple)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildTimerConfigTile(BuildContext context,
        {required String label,
        required int? value,
        required void Function(int?) onChanged}) =>
    ListTile(
      title: Text(
        label,
        style: context.theme.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.onSurface, fontWeight: FontWeight.bold),
      ),
      trailing: DropdownButton<int>(
        value: value,
        onChanged: onChanged,
        items: List.generate(60, (index) => index + 1)
            .map((e) => DropdownMenuItem<int>(
                  value: e,
                  child: Text(e.toString()),
                ))
            .toList(),
      ),
    );

Widget _buildFontPickerTile(
  WidgetRef ref, {
  required String label,
  required TextThemePref value,
  required void Function(TextThemePref) onChanged,
}) {
  var selected =
      ref.read(appThemeBuilderProvider.notifier).getPreferredTextTheme() ==
          value;
  // build the text theme based on the selected value
  TextTheme textTheme;
  switch (value) {
    case TextThemePref.robotoSlab:
      textTheme = kRobotoSlab;
      break;
    case TextThemePref.spaceMono:
      textTheme = kSpaceMono;
      break;
    default:
      textTheme = kKumbhSans;
      break;
  }
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        height: 48,
        width: 48,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: selected
              ? ref.context.colorScheme.background
              : ref.context.colorScheme.surface,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          'Aa',
          style: textTheme.titleMedium?.copyWith(
              color: selected
                  ? ref.context.colorScheme.onBackground
                  : ref.context.colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

Widget _buildColorPickerTile(
  WidgetRef ref, {
  required Color value,
  required void Function(Color) onChanged,
}) {
  var selected =
      ref.watch(appThemeBuilderProvider).colorScheme.primary == value;
  var iconColor = value.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        height: 48,
        width: 48,
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: value, borderRadius: BorderRadius.circular(40)),
        alignment: Alignment.center,
        child: selected
            ? Icon(Icons.check, color: iconColor)
            : const SizedBox.expand(),
      ),
    ),
  );
}
