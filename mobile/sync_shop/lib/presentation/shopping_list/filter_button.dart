import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.items,
    required this.categories,
  });

  final List<dynamic> items;
  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: items.isNotEmpty
              ? colorScheme.surface
              : colorScheme.surface.withOpacity(0.5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () => context.push('/categories'),
          splashColor: Colors.grey.withOpacity(0.5),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.filter_alt,
                  size: 35,
                  color: colorScheme.background,
                ),
                const SizedBox(width: 10),
                Text(
                  'Filter',
                  style: TextStyle(
                      fontSize: 16,
                      color: items.isNotEmpty
                          ? colorScheme.background
                          : colorScheme.background.withOpacity(0.5)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
