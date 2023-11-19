import 'package:flutter/material.dart';

class PrioritySelector extends StatelessWidget {
  const PrioritySelector({
    super.key,
    required this.selectedPriority,
    required this.onChanged,
  });

  final int selectedPriority;
  final void Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Priority',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimary,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: colorScheme.surface,
              border: Border.all(
                color: colorScheme.surfaceVariant,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PriorityCircle(
                  color: Colors.green,
                  selected: selectedPriority == 0,
                  onPressed: () {
                    onChanged(0);
                  },
                ),
                PriorityCircle(
                  color: Colors.yellow,
                  selected: selectedPriority == 1,
                  onPressed: () {
                    onChanged(1);
                  },
                ),
                PriorityCircle(
                  color: Colors.red,
                  selected: selectedPriority == 2,
                  onPressed: () {
                    onChanged(2);
                  },
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Low', style: TextStyle(color: colorScheme.onPrimary)),
              Text('High', style: TextStyle(color: colorScheme.onPrimary)),
            ],
          )
        ],
      ),
    );
  }
}

class PriorityCircle extends StatelessWidget {
  final Color color;
  final bool selected;
  final VoidCallback onPressed;

  const PriorityCircle(
      {super.key,
      required this.color,
      required this.selected,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: Border.all(
            color: selected ? colorScheme.background : Colors.transparent,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
