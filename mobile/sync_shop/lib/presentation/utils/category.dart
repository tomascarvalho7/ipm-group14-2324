import 'package:flutter/material.dart';
import 'package:sync_shop/domain/provider/categories_controller.dart';

Widget category(BuildContext context, Category category, CategoriesController categories, double width, double height) => ElevatedButton(
    onPressed: () => categories.interact(category),
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3),
          side: categories.isSelected(category) ? BorderSide(
            color: Theme.of(context).colorScheme.primary, // Set border color
            width: 4.0, // Set border width
          ) : BorderSide.none,
      ),
      maximumSize: Size(width, height),
      minimumSize: Size(width, height),
    ),
    child: Image.asset(
        'assets/SyncShopIcon.png',
    )
);