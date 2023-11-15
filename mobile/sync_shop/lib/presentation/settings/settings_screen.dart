
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/build_minor_screen_template.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';
import 'package:sync_shop/presentation/utils/return_button.dart';
import 'package:sync_shop/presentation/utils/text_format.dart';
import 'package:sync_shop/presentation/utils/text_input.dart';

import '../utils/text_input_box.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key, required this.householdName, required this.inviteURL});
  final String householdName;
  final String inviteURL;

  @override
  Widget build(BuildContext context) =>
      buildMinorScreenTemplate(
          context: context,
          child: Column(
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
                              returnButton(context, () => {}),
                            ],
                          ),
                          const Text(
                            'Settings',
                            style: TextStyle(
                              color: Color(0xFFA89780),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    SizedBox(
                      height: 330,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          inviteBox(),
                          const SizedBox(height: 35),
                          TextInputBox(hintText: householdName, height: 55),
                          const SizedBox(height: 35),
                          inputImage()
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    greenButton(onPressed: () {  }),
                  ],
                ),
              ),
            ],
          )
      );

  Widget inviteBox() => Container(
    width: double.infinity,
    height: 55,
    decoration: ShapeDecoration(
      color: const Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
    child: Row(
      children: [
        SizedBox(width: 5),
        Icon(Icons.copy, size: 35, color: Color(0xFF2E7D44)),
        SizedBox(width: 10),
        textFormat(inviteURL, Color(0xFF2E7D44), 20)
      ],
    )
  );

  Widget inputImage() => Container(
    width: 150,
    height: 150,
    decoration: ShapeDecoration(
      color: Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
  );
}