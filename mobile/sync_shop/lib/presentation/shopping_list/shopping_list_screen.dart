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
  List<dynamic>? items;
  List<dynamic> boughtItems = [];
  List<String> categories = [];
  String? newListName;

  @override
  void initState() {
    super.initState();
    _refreshLists();
  }

  Future<void> _refreshLists() async {
    RealService service = context.read<RealService>();
    final newItems = await service.getShoppingList(widget.listId, categories);
    setState(() {
      items = newItems.toList();
    });
    final newBoughtItems = await service.getBoughtList(widget.listId);
    setState(() {
      boughtItems = newBoughtItems.toList();
    });
  }

  Future<void> _refreshListName() async {
    RealService service = context.read<RealService>();
    final newName = await service.getListName(widget.listId);
    setState(() {
      newListName = newName;
    });
  }

  void _setCategories(List<String> value) {
    setState(() {
      categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(
      context,
      newListName ?? widget.listName,
      settingsRoute: '/list/${widget.listId}/settings',
      settingsAction: () => _refreshListName().then((value) => _refreshLists()),
      [
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                FilterButton(
                  categories: categories,
                  setCategories: _setCategories,
                  onRefresh: _refreshLists,
                ),
                const SizedBox(height: 20),
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
