import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';

class AddItemButton extends StatefulWidget {
  const AddItemButton({super.key, required this.listId});

  final int listId;

  @override
  State<AddItemButton> createState() => _AddItemButtonState();
}

class _AddItemButtonState extends State<AddItemButton> {
  List<dynamic>? _items = [];

  @override
  void initState() {
    super.initState();
    _getBoughtItems(widget.listId);
  }

  Future<void> _getBoughtItems(int id) async {
    final boughtItems = await context.read<RealService>().getBoughtList(id);
    setState(() {
      _items = boughtItems?.toList() ?? [];
    });
  }

  Future<void> _readdItem(int id) async {
    await context.read<RealService>().updateProduct(
          id,
          false,
        );
    _getBoughtItems(widget.listId);
  }

  void showAddItemDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();
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
              ..._items!.map(
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
                  // Handle adding a new item
                  if (controller.text.isNotEmpty) {
                    // addItem(controller.text);
                    print('Added new item: ${controller.text}');
                  }
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
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xFF006400),
      onPressed: () {
        showAddItemDialog(context);
      },
      child: const Icon(Icons.add),
    );
  }
}
