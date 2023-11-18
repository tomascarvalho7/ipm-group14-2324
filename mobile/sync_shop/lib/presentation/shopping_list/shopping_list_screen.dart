import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/shopping_list/add_item_button.dart';
import 'package:sync_shop/presentation/shopping_list/shopping_list.dart';
import 'package:sync_shop/screen_template.dart';

class ShoppingListScreen extends StatelessWidget {
  const ShoppingListScreen({super.key, required this.listId});

  final int listId;

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      'Shopping List',
      settingsRoute: '/list/$listId/settings',
      [
        Stack(
          children: [
            ShoppingList(listId: listId),
            Positioned(
              bottom: 10,
              right: 10,
              child: AddItemButton(
                listId: listId,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
