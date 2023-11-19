import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';

enum Actions { delete, bought }

class ShoppingList extends StatefulWidget {
  const ShoppingList({
    super.key,
    required this.listId,
    required this.items,
    required this.onRefresh,
  });

  final int listId;
  final List<dynamic>? items;
  final Future<void> Function() onRefresh;

  @override
  State<ShoppingList> createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  void _showSnackBar(String text, Color color) {
    final snackBar = SnackBar(
      content: Text(text),
      backgroundColor: color,
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> _onDismissed(int index, Actions action) async {
    final RealService service = context.read<RealService>();
    switch (action) {
      case Actions.delete:
        _showSnackBar('Item is deleted', Colors.red);
        await service.deleteProduct(widget.listId, widget.items![index]['id']);
        break;
      case Actions.bought:
        _showSnackBar('Item is bought', Colors.green);
        await service.updateProduct(
            widget.listId, widget.items![index]['id'], true);
        break;
    }
    await widget.onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final List<dynamic>? items = widget.items;
    if (items == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return RefreshIndicator(
      displacement: 10,
      onRefresh: widget.onRefresh,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Slidable(
              key: UniqueKey(),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  _onDismissed(index, Actions.bought);
                }),
                children: [
                  SlidableAction(
                    onPressed: (context) => _onDismissed(index, Actions.bought),
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
                    onPressed: (context) => _onDismissed(index, Actions.delete),
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ListTile(
                  title: Text(
                    '${items[index]['name']} (${items[index]['categories'].toList().join('/')})',
                    style: TextStyle(
                      fontSize: 16,
                      color: colorScheme.surfaceVariant,
                    ),
                  ),
                  trailing: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: items[index]['priority'] == 0
                          ? Colors.green
                          : items[index]['priority'] == 1
                              ? Colors.yellow
                              : Colors.red,
                    ),
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
