import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/presentation/shopping_list/add_item_button.dart';
import 'package:sync_shop/presentation/shopping_list/filter_button.dart';
import 'package:sync_shop/presentation/shopping_list/shopping_list.dart';
import 'package:sync_shop/screen_template.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({
    super.key,
    required this.listId,
    required this.listName,
  });

  final int listId;
  final String listName;

  @override
  State<ShoppingListScreen> createState() => _ShoppingListScreenState();
}

class _ShoppingListScreenState extends State<ShoppingListScreen> {
  List<dynamic> items = [];
  List<dynamic> boughtItems = [];
  List<String> categories = [];

  @override
  void initState() {
    super.initState();
    _refreshLists();
  }

  Future<void> _refreshLists() async {
    RealService service = context.read<RealService>();
    final newItems = await service.getShoppingList(widget.listId);
    setState(() {
      items = newItems.toList();
    });
    final newBoughtItems = await service.getBoughtList(widget.listId);
    setState(() {
      boughtItems = newBoughtItems.toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      widget.listName,
      settingsRoute: '/list/${widget.listId}/settings',
      [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const FilterButton(items: [''], categories: []),
                const SizedBox(height: 10),
                Expanded(
                  child: ShoppingList(
                    listId: widget.listId,
                    items: items,
                    onRefresh: _refreshLists,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: AddItemButton(
                listId: widget.listId,
                boughtItems: boughtItems,
                onRefresh: _refreshLists,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
