import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/presentation/list_selection/action_pop_up.dart';
import 'package:sync_shop/presentation/list_selection/add_buttons.dart';
import 'package:sync_shop/presentation/list_selection/list_item.dart';
import 'package:sync_shop/screen_template.dart';

class ListSelectionScreen extends StatefulWidget {
  ListSelectionScreen({Key? key, required this.shouldUpdate}) : super(key: key);
  final bool shouldUpdate;

  @override
  State<ListSelectionScreen> createState() => _ListSelectionScreenState();
}

class _ListSelectionScreenState extends State<ListSelectionScreen> {
  bool _isJoinPopupVisible = false;
  bool _isCreatePopupVisible = false;
  List<dynamic> _lists = [];

  @override
  void initState() {
    super.initState();
    _getLists();
  }

  @override
  void didUpdateWidget(covariant ListSelectionScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldUpdate) _getLists();
  }

  Future<void> _getLists() async {
    final listsResult = await context.read<RealService>().getListsForUser();
    setState(() => _lists = listsResult);
  }

  @override
  Widget build(BuildContext context) {
    final services = Provider.of<RealService>(context);

    return buildScreenTemplateWidget(
      context,
      "My Lists",
      [
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 100),
          child: GridView.builder(
            physics:
                const ClampingScrollPhysics(), //not sure mas se der asneira logo se vê
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Adjust the number of columns as needed
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemCount: _lists.length,
            itemBuilder: (context, index) {
              final data = _lists[index];
              return ListItem(
                onClick: () =>
                    context.push('/lists/${data['id']}', extra: data['name']).then((value) => _getLists()),
                imageUrl: data['picture'] ?? "",
                text: data['name'],
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .surface,
              );
            },
          ),
        ),
        Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
                padding: const EdgeInsets.only(left: 30, bottom: 20),
                child: ListButton(
                    text: "Join",
                    onClick: () {
                      setState(() {
                        _isJoinPopupVisible = true;
                      });
                    }))),
        Align(
            alignment: Alignment.bottomRight,
            child: Padding(
                padding: const EdgeInsets.only(right: 30, bottom: 20),
                child: ListButton(
                    text: "Create",
                    onClick: () {
                      setState(() {
                        _isCreatePopupVisible = true;
                      });
                    }))),
        ActionPopup(
          onClose: () {
            setState(() {
              _isJoinPopupVisible = false;
              _isCreatePopupVisible = false;
            });
          },
          onClick: (value) {
            services.joinList(value).then((value) {
              if (value) {
                _getLists();
                _isJoinPopupVisible = false;
                _isCreatePopupVisible = false;
              }
            });
          },
          isPopupVisible: _isJoinPopupVisible,
          buttonText: "Join!",
          textFieldText: "Paste Code",
        ),
        ActionPopup(
          onClose: () {
            setState(() {
              _isJoinPopupVisible = false;
              _isCreatePopupVisible = false;
            });
          },
          onClick: (value) {
            services.createList(value).then((value) {
              _getLists();
              _isJoinPopupVisible = false;
              _isCreatePopupVisible = false;
            });
          },
          isPopupVisible: _isCreatePopupVisible,
          buttonText: "Create!",
          textFieldText: "List Name",
        )
      ],
      showBackButton: false,
    );
  }
}
