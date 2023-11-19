import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/domain/household.dart';
import 'package:sync_shop/presentation/build_minor_screen_template.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';

import '../../screen_template.dart';
import '../utils/copy_button.dart';
import '../utils/text_input_box.dart';

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
  void update(String input) { nameInput = input; }

  @override
  void initState() {
    super.initState();
    _data = context.read<RealService>().getShoppingListInfo(widget.listId);
  }

  @override
  Widget build(BuildContext context) {
    final RealService service = context.read<RealService>();

    return buildMinorScreenTemplate(
        context: context,
        child: FutureBuilder(
            future: _data,
            builder: (ctx, snapshot) {
              ShoppingList? list = snapshot.data;
              if (list != null) {
                nameInput = list.name;
                return visual(service, snapshot.data!);
              } else {
                return Container();
              }
            }
        )
    );
  }

  Widget visual(RealService service, ShoppingList list) => Column(
    mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      logo(),
                      const SizedBox(width: 75),
                      // pop => return to previous screen
                      const ReturnBackButton(),
                    ],
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                      fontSize: 24,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            householdInputs(context, list, update),
            const SizedBox(height: 40),
            greenButton(
                onPressed: () {
                  print(nameInput);
                  service.updateList(list.id, nameInput);
                  context.pop();
                }),
          ],
        ),
      ),
    ],
  );

  Widget householdInputs(BuildContext context, ShoppingList household,
          Function(String) onChange) =>
      SizedBox(
        height: 330,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 55, child: copyButton(context, household.url)),
            const SizedBox(height: 35),
            TextInputBox(hintText: household.name, height: 55, onChange: onChange),
            const SizedBox(height: 35),
            inputImage()
          ],
        ),
      );

  Widget inputImage() => Container(
        width: 150,
        height: 150,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.surfaceVariant,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        ),
        child: const Icon(Icons.camera_alt, size: 64,)
      );
}
