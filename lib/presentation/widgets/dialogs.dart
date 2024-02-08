import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/app/theme.dart';
import 'package:pomodoro/core/utils/extensions.dart';
import 'package:pomodoro/presentation/manager/theme.dart';
import 'package:pomodoro/presentation/manager/timer.dart';
import 'package:pomodoro/presentation/widgets/duration_picker.dart';

Future<void> showSettingsDialog(WidgetRef ref) async {
  var context = ref.context;

  // get the current theme provider & the selected theme and text preferences
  var themeProvider = ref.read(appThemeBuilderProvider.notifier),
      selectedThemePref = themeProvider.getPreferredAppTheme(),
      selectedTextThemePref = themeProvider.getPreferredTextTheme();

  // show the settings dialog
  await showDialog(
    context: context,
    useRootNavigator: true,
    builder: (ctx) => AlertDialog(
      contentPadding: const EdgeInsets.fromLTRB(12, 16, 12, 24),
      backgroundColor: Colors.transparent,
      content: StatefulBuilder(
          builder: (context, setState) => SizedBox(
                width: context.width,
                height: context.height * (context.isTablet ? 0.6 : 0.8),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          color: context.colorScheme.surface,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Settings',
                                      style: context
                                          .theme.textTheme.headlineMedium),
                                  IconButton(
                                      onPressed: context.navigator.pop,
                                      icon: const Icon(Icons.close),
                                      tooltip: 'Close',
                                      color: context.theme.iconTheme.color),
                                ],
                              ),
                            ),
                            const Divider(height: 8),
                            SingleChildScrollView(
                              padding: const EdgeInsets.only(
                                  top: 24, left: 16, right: 16),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Time (Minutes)'.toUpperCase(),
                                    style:
                                        context.theme.textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTimerConfigTile(
                                    ctx,
                                    label: 'pomodoro',
                                    value: ref
                                        .read(timerConfigBuilderProvider)
                                        .pomodoro,
                                    onChanged: (value) => ref
                                        .read(
                                            timerConfigBuilderProvider.notifier)
                                        .setPomodoro(value),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTimerConfigTile(
                                    ctx,
                                    label: 'short break',
                                    value: ref
                                        .read(timerConfigBuilderProvider)
                                        .shortBreak,
                                    onChanged: (value) => ref
                                        .read(
                                            timerConfigBuilderProvider.notifier)
                                        .setShortBreak(value),
                                  ),
                                  const SizedBox(height: 16),
                                  _buildTimerConfigTile(
                                    ctx,
                                    label: 'long break',
                                    value: ref
                                        .read(timerConfigBuilderProvider)
                                        .longBreak,
                                    onChanged: (value) => ref
                                        .read(
                                            timerConfigBuilderProvider.notifier)
                                        .setLongBreak(value),
                                  ),
                                  const SizedBox(height: 24),
                                  const Divider(height: 8),
                                  const SizedBox(height: 24),
                                  Text(
                                    'Font'.toUpperCase(),
                                    style:
                                        context.theme.textTheme.headlineSmall,
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildFontPickerTile(ref,
                                          label: 'Kumbh Sans',
                                          selected: selectedTextThemePref ==
                                              TextThemePref.kumbhSans,
                                          value: TextThemePref.kumbhSans,
                                          onChanged: (value) => setState(() =>
                                              selectedTextThemePref = value)),
                                      _buildFontPickerTile(ref,
                                          label: 'Roboto Slab',
                                          selected: selectedTextThemePref ==
                                              TextThemePref.robotoSlab,
                                          value: TextThemePref.robotoSlab,
                                          onChanged: (value) => setState(() =>
                                              selectedTextThemePref = value)),
                                      _buildFontPickerTile(ref,
                                          label: 'Space Mono',
                                          selected: selectedTextThemePref ==
                                              TextThemePref.spaceMono,
                                          value: TextThemePref.spaceMono,
                                          onChanged: (value) => setState(() =>
                                              selectedTextThemePref = value)),
                                    ],
                                  ),
                                  const SizedBox(height: 24),
                                  const Divider(height: 8),
                                  const SizedBox(height: 24),
                                  Text('Color'.toUpperCase(),
                                      style: context
                                          .theme.textTheme.headlineSmall),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      _buildColorPickerTile(ref,
                                          value: kOrangeTheme()
                                              .colorScheme
                                              .primary,
                                          selected: selectedThemePref ==
                                              AppThemePref.orange,
                                          onChanged: () => setState(() =>
                                              selectedThemePref =
                                                  AppThemePref.orange)),
                                      _buildColorPickerTile(ref,
                                          value:
                                              kGreenTheme().colorScheme.primary,
                                          selected: selectedThemePref ==
                                              AppThemePref.green,
                                          onChanged: () => setState(() =>
                                              selectedThemePref =
                                                  AppThemePref.green)),
                                      _buildColorPickerTile(ref,
                                          value: kPurpleTheme()
                                              .colorScheme
                                              .primary,
                                          selected: selectedThemePref ==
                                              AppThemePref.purple,
                                          onChanged: () => setState(() =>
                                              selectedThemePref =
                                                  AppThemePref.purple)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -(context.height * 0.03),
                      left: 0,
                      right: 0,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            // apply the selected theme & text preferences
                            themeProvider
                              ..switchTheme(selectedThemePref)
                              ..switchTextTheme(selectedTextThemePref);
                            context.navigator.pop();
                          },
                          child: Container(
                            width:
                                context.width * (context.isTablet ? 0.2 : 0.35),
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                color: context.colorScheme.primary,
                                borderRadius: BorderRadius.circular(100)),
                            alignment: Alignment.center,
                            child: Text('Apply',
                                style: context.theme.textTheme.labelLarge
                                    ?.copyWith(
                                        color: context.colorScheme.onPrimary)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
    ),
  );
}

Widget _buildTimerConfigTile(BuildContext context,
        {required String label,
        required int? value,
        required void Function(int?) onChanged}) =>
    Row(
      children: [
        Text(
          label,
          style: context.theme.textTheme.bodySmall?.copyWith(
              color: context.colorScheme.onSurface,
              fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        DurationPicker(
          onDurationChanged: onChanged,
          initialValue: value,
        ),
      ],
    );

Widget _buildFontPickerTile(
  WidgetRef ref, {
  required String label,
  required TextThemePref value,
  required void Function(TextThemePref) onChanged,
  required bool selected,
}) {
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
              : ref.context.theme.disabledColor,
          borderRadius: BorderRadius.circular(100),
        ),
        alignment: Alignment.center,
        child: Text(
          'Aa',
          style: textTheme.labelMedium?.copyWith(
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
  required void Function() onChanged,
  required bool selected,
}) {
  var iconColor = value.computeLuminance() > 0.5 ? Colors.white : Colors.black;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8),
    child: GestureDetector(
      onTap: onChanged,
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
