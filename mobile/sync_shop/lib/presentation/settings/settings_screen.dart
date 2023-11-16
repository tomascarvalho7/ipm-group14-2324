
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/domain/household.dart';
import 'package:sync_shop/presentation/build_minor_screen_template.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';
import 'package:sync_shop/presentation/utils/return_button.dart';

import '../utils/copy_button.dart';
import '../utils/text_input_box.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.household});
  // constructor variables
  final Household household;

  @override
  State<StatefulWidget> createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  late String nameInput = widget.household.name;
  // update fn
  void update(String input) => setState(() => nameInput = input);


  @override
  Widget build(BuildContext context) {
    final Household household = widget.household;
    final RealService service = context.read<RealService>();

    return buildMinorScreenTemplate(
        context: context,
        child:  Column(
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
                            returnButton(context, () => context.pop()),
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
                  householdInputs(context, household, update),
                  const SizedBox(height: 40),
                  greenButton(onPressed: () => service.updateHousehold(household.id, nameInput)),
                ],
              ),
            ),
          ],
        )
    );
  }

  Widget householdInputs(BuildContext context, Household household, Function(String) onChange) => SizedBox(
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
  );
}