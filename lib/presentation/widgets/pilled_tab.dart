import 'package:flutter/material.dart';
import 'package:pomodoro/core/utils/extensions.dart';

class PilledTab extends StatelessWidget {
  final List<String> labels;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const PilledTab({
    super.key,
    required this.labels,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) => Container(
        height: context.height * 0.08,
        margin: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        padding: EdgeInsets.symmetric(
            horizontal: 12, vertical: context.height * 0.01),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: context.colorScheme.secondary,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: labels.map((label) => _buildTab(context, label)).toList(),
        ),
      );

  Widget _buildTab(BuildContext context, String label) {
    final active = selectedIndex == labels.indexOf(label);
    return Expanded(
      child: InkWell(
        onTap: () => onSelected(labels.indexOf(label)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: active ? context.colorScheme.primary : null,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Center(
            child: Text(
              label.toLowerCase(),
              style: context.theme.textTheme.bodySmall?.copyWith(
                  color: active
                      ? context.colorScheme.onPrimary
                      : context.colorScheme.onSecondary.withOpacity(0.6)),
            ),
          ),
        ),
      ),
    );
  }
}
