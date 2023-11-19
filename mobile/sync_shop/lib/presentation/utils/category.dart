import 'package:flutter/material.dart';
import 'package:sync_shop/domain/provider/categories_controller.dart';

Widget category(BuildContext context, Category category, CategoriesController categories, double width, double height) =>
    ElevatedButton(
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
    child: Stack(
      fit: StackFit.expand,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
          child: Image.asset(
              categoryToImage(category)
          )
        ),
        Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              categoryToName(category),
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 3
                  ..color = Colors.black54,
              ),
            )
        ),
        Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  categoryToName(category),
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                  ),
                )
            )
      ]
    )
);