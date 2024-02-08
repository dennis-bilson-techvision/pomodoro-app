import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pomodoro/core/utils/constants.dart';
import 'package:pomodoro/core/utils/extensions.dart';
import 'package:pomodoro/presentation/widgets/dialogs.dart';
import 'package:pomodoro/presentation/widgets/pilled_tab.dart';

/// TimerPage is the main page for the Pomodoro app.
/// It displays 3 tabs for the user to select from: Pomodoro, Short, Long timers
class TimerPage extends ConsumerStatefulWidget {
  const TimerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerPageState();
}

class _TimerPageState extends ConsumerState<TimerPage> {
  final _labels = ['Pomodoro', 'Short Break', 'Long Break'];
  var _selectedIndex = 0;

  void _onSelected(int index) => setState(() => _selectedIndex = index);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(kAppName)),
        body: Column(
          children: [
            SizedBox(height: context.height * 0.1),
            /// tabs
            PilledTab(
                labels: _labels,
                selectedIndex: _selectedIndex,
                onSelected: _onSelected),
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

  Widget _renderTimerUI() {


    return Container();
  }
}
