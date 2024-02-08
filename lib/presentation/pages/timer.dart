import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/utils/constants.dart';
import 'package:pomodoro/core/utils/extensions.dart';
import 'package:pomodoro/presentation/widgets/dialogs.dart';

/// TimerPage is the main page for the Pomodoro app.
/// It displays 3 tabs for the user to select from: Pomodoro, Short, Long timers
class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends ConsumerState<TimerPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(kAppName)),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[],
          ),
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
}
