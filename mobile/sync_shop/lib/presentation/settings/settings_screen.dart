
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';
import 'package:sync_shop/presentation/utils/return_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF2E2E2E)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
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
                            returnButton(),
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
                        inputBox(),
                        const SizedBox(height: 35),
                        inputBox(),
                        const SizedBox(height: 35),
                        inputImage()
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  greenButton(),
                ],
              ),
            ),
          ],
        ),
      );

  Widget inputBox() => Container(
    width: double.infinity,
    height: 55,
    decoration: ShapeDecoration(
      color: Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
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