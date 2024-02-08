import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/utils/constants.dart';
import 'package:pomodoro/presentation/manager/theme.dart';
import 'package:pomodoro/presentation/pages/timer.dart';

class PomodoroApp extends ConsumerWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: kAppName,
        theme: ref.watch(appThemeBuilderProvider),
        home: const TimerPage(),
      );
}
