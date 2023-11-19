import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.categories,
    required this.setCategories,
    required this.onRefresh,
  });

  final List<String> categories;
  final void Function(List<String>) setCategories;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Material(
      borderRadius: BorderRadius.circular(15),
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: colorScheme.surface,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: () async {
            final List<String>? newCategories =
                await context.push('/categories');
            if (newCategories != null) {
              setCategories(newCategories);
              await onRefresh();
            }
          },
          splashColor: Colors.grey.withOpacity(0.5),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.filter_alt,
                  size: 25,
                  color: colorScheme.background,
                ),
                Text('Filter',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.background,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
