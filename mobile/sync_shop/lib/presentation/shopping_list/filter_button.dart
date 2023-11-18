import 'package:flutter/material.dart';

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
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colorScheme.surface,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () async {
            setCategories(["Vegetables", "Fruit"]);
            await onRefresh();
            // context.push('/categories');
          },
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
