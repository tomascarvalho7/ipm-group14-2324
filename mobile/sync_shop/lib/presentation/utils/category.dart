import 'package:flutter/material.dart';
import 'package:sync_shop/domain/provider/categories_controller.dart';

Widget category(BuildContext context, Category category, CategoriesController categories, double width, double height) =>
    ElevatedButton(
    onPressed: () => categories.interact(category),
    style: ElevatedButton.styleFrom(
      elevation: 2,
      backgroundColor: Theme.of(context).colorScheme.surface,
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
    child: Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          child: Image.asset(
              categoryToImage(category)
          )
        ),
        Container(
            width: double.infinity,
            alignment: Alignment.bottomLeft,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Theme.of(context).colorScheme.surface,
                    Theme.of(context).colorScheme.surface.withAlpha(245),
                    Theme.of(context).colorScheme.surface.withAlpha(30),
                    Theme.of(context).colorScheme.surface.withAlpha(0),
                    Theme.of(context).colorScheme.surface.withAlpha(0)
                  ]
              )
            ),
          child: Text(
            categoryToName(category),
            style: TextStyle(
                height: 1.0,
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.tertiary
            ),
          )
        ),
      ]
    )
);