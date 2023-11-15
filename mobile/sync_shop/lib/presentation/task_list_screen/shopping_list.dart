import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum Actions { delete, bought }

class ShoppingList extends StatefulWidget {
  const ShoppingList({Key? key}) : super(key: key);

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  final List<String> items =
      List<String>.generate(10, (index) => 'Product $index');

  void _onDismissed(int index, Actions action) {
    setState(() {
      items.removeAt(index);
    });

    switch (action) {
      case Actions.delete:
        _showSnackBar(context, 'Item is deleted', Colors.red);
        break;
      case Actions.bought:
        _showSnackBar(context, 'Item is bought', Colors.green);
        break;
    }
  }

  void _showSnackBar(BuildContext context, String text, Color color) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _onDismissed(index, Actions.bought);
            },
            child: Card(
              child: Slidable(
                key: UniqueKey(),
                startActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {
                    _onDismissed(index, Actions.bought);
                  }),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          _onDismissed(index, Actions.bought),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      icon: Icons.check,
                      label: 'Bought',
                    ),
                  ],
                ),
                endActionPane: ActionPane(
                  motion: const ScrollMotion(),
                  dismissible: DismissiblePane(onDismissed: () {
                    _onDismissed(index, Actions.delete);
                  }),
                  children: [
                    SlidableAction(
                      onPressed: (context) =>
                          _onDismissed(index, Actions.delete),
                      backgroundColor: const Color(0xFFFE4A49),
                      foregroundColor: Colors.white,
                      icon: Icons.delete,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16.0),
                  title: Text(items[index]),
                  trailing: const Icon(Icons.check_circle_outline),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

void doNothing(BuildContext context) {}
