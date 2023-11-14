import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:sync_shop/screen_template.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      'Shopping List',
      [
        ListView.builder(
          itemCount: 10, // replace with your actual item count
          padding: const EdgeInsets.all(20.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                // Handle the button click here
                // You can navigate to a details page or perform other actions
              },
              child: Card(
                child: Slidable(
                  key: const ValueKey(0),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: const [
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.check,
                        label: 'Bought',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () {}),
                    children: const [
                      SlidableAction(
                        onPressed: doNothing,
                        backgroundColor: Color(0xFFFE4A49),
                        foregroundColor: Colors.white,
                        icon: Icons.delete,
                        label: 'Delete',
                      ),
                    ],
                  ),
                  child: const ListTile(
                    contentPadding: EdgeInsets.all(16.0),
                    title: Text('Product Name'),
                    trailing:
                        Icon(Icons.check_circle_outline), // Confirm symbol
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

void doNothing(BuildContext context) {}
