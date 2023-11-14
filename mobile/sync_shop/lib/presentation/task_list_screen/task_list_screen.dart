import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/task_list_screen/add_item_button.dart';
import 'package:sync_shop/presentation/task_list_screen/shopping_list.dart';
import 'package:sync_shop/screen_template.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      'Shopping List',
      [
        const Stack(
          children: [
            ShoppingList(),
            Positioned(
              bottom: 10,
              right: 10,
              child: AddItemButton(),
            ),
          ],
        ),
      ],
    );
  }
}
