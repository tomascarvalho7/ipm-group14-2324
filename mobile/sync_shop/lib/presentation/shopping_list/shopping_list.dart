import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';

enum Actions { delete, bought }

class ShoppingList extends StatefulWidget {
  const ShoppingList({super.key, required this.listId});

  final int listId;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  List<dynamic> items = [];

  @override
  void initState() {
    super.initState();
    _getShoppingList(widget.listId);
  }

  Future<void> _getShoppingList(int id) async {
    final shoppingList = await context.read<RealService>().getShoppingList(id);
    setState(() {
      items = shoppingList?.toList() ?? [];
    });
  }

  Future<void> _onDismissed(int index, Actions action) async {
    switch (action) {
      case Actions.delete:
        _showSnackBar(context, 'Item is deleted', Colors.red);
        await context.read<RealService>().deleteProduct(items[index]['id']);
        // remove item from shopping list
        break;
      case Actions.bought:
        _showSnackBar(context, 'Item is bought', Colors.green);
        await context.read<RealService>().updateProduct(
              items[index]['id'],
              true,
            );
        // update item to bought
        break;
    }
    _getShoppingList(widget.listId);
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
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SlidableAutoCloseBehavior(
      child: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final data = items[index];
          return GestureDetector(
            onTap: () {
              _onDismissed(index, Actions.bought);
            },
            child: Card(
              color: colorScheme.surface,
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
                  title: Text(
                    items[index]['name'] ?? "Nameless Item",
                    style: TextStyle(
                      color: colorScheme.background,
                    ),
                  ),
                  trailing: Icon(
                    Icons.check_circle_outline,
                    color: colorScheme.primary,
                  ),
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
