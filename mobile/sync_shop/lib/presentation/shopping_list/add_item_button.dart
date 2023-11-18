import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({
    super.key,
    required this.listId,
    required this.boughtItems,
    required this.onRefresh,
  });

  final int listId;
  final List<dynamic> boughtItems;
  final void Function() onRefresh;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  Future<void> _readdItem(int id) async {
    await context.read<RealService>().updateProduct(
          widget.listId,
          id,
          false,
        );
    widget.onRefresh();
  }

  void showAddItemDialog(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Choose or create an item',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16.0),
              ...widget.boughtItems.map(
                (item) => ListTile(
                  title: Text(
                    item['name'],
                    style: TextStyle(color: colorScheme.background),
                  ),
                  onTap: () {
                    _readdItem(item['id']);
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  context.push("/lists/${widget.listId}/newProduct");
                  Navigator.pop(context);
                },
                child: const Center(
                  child: Text(
                    'Add New Item',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color(0xFF006400),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return FloatingActionButton(
      heroTag: 'addItemButton',
      shape: const CircleBorder(),
      backgroundColor: colorScheme.background,
      onPressed: () {
        showAddItemDialog(context);
      },
      child: Icon(
        Icons.add,
        color: colorScheme.surface,
      ),
    );
  }
}
