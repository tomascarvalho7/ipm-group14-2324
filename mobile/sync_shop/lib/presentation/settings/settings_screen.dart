import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/domain/household.dart';
import 'package:sync_shop/presentation/build_minor_screen_template.dart';
import 'package:sync_shop/presentation/utils/copy_button.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';
import 'package:sync_shop/presentation/utils/text_input_box.dart';
import 'package:sync_shop/providers/feedback_controller.dart';
import 'package:sync_shop/screen_template.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.listId});
  // constructor variables
  final int listId;

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  late ShoppingList list;
  late String nameInput;
  late Future<ShoppingList> _data;
  // update fn
  void update(String input) {
    nameInput = input;
  }

  @override
  void initState() {
    super.initState();
    _data = context.read<RealService>().getShoppingListInfo(widget.listId);
  }

  @override
  Widget build(BuildContext context) {
    final RealService service = context.read<RealService>();
    final feedback = context.read<FeedbackController>();

    return buildScreenTemplateWidget(
        context,
        'Settings',
        [
          FutureBuilder(
              future: _data,
              builder: (ctx, snapshot) {
                ShoppingList? list = snapshot.data;
                if (list != null) {
                  nameInput = list.name;
                  return visual(service, snapshot.data!, feedback);
                } else {
                  return Container();
                }
              })
        ],
        showBackground: false,
        resizeToAvoidBottomInset: false);
  }

  Widget visual(RealService service, ShoppingList list, FeedbackController controller) => Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(height: 50),
      householdInputs(context, list, update, controller),
      const SizedBox(height: 10),
      actionButton(
          Theme.of(context).colorScheme.primary,
          Theme.of(context).colorScheme.background,
          "Confirm",
          onPressed: () {
            controller.setSuccessful("Updated list successfully.");
            service.updateList(list.id, nameInput);
            context.pop(nameInput);
          }),
      actionButton(
          Theme.of(context).colorScheme.error,
          Theme.of(context).colorScheme.background,
          "Leave List",
          onPressed: () {
            controller.setSuccessful("Left list successfully.");
            service.leaveFromList(list.id);
            context.go('/lists', extra: true); // go back to lists screen
          }),
    ],
  );

  Widget householdInputs(BuildContext context, ShoppingList household,
          Function(String) onChange, FeedbackController controller) =>
      SizedBox(
        height: 330,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 55,
                child: copyButton(
                    context,
                    household.url,
                    (content) {
                      controller.setSuccessful("Copied list code to clipboard.");
                      Clipboard.setData(ClipboardData(text: content));
                    }
                )
            ),
            const SizedBox(height: 35),
            TextInputBox(
                hintText: household.name, height: 55, onChange: onChange),
            const SizedBox(height: 35),
            inputImage()
          ],
        ),
      );

  Widget inputImage() => Container(
      width: 150,
      height: 150,
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: const Icon(
        Icons.camera_alt,
        size: 64,
      ));
}
