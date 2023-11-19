import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    Key? key, // Add the 'key' parameter here
    required this.categories,
    required this.setCategories,
    required this.onRefresh,
  }) : super(key: key);

  final List<String> categories;
  final void Function(List<String>) setCategories;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
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
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2), // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.filter_alt,
              size: 25,
              color: colorScheme.surfaceVariant,
            ),
            Text('Filter',
                style: TextStyle(
                  fontSize: 16,
                  color: colorScheme.surfaceVariant,
                )),
          ],
        ),
      ),
    );
  }
}
