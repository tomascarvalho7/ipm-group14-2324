import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';

import '../utils/return_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      Container(
        padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 20),
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFF2E2E2E)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      logo(),
                      const SizedBox(width: 75),
                      returnButton(context, () => {})
                    ],
                  ),
                  const Text(
                    'Filter by Categories',
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
                height: 350,
                child: categories()
            ),
            const SizedBox(height: 75),
            greenButton(onPressed: () {  }),
          ],
        ),
      );



  Widget shapedBox(double width, double height, Widget? child) => Container(
    width: width,
    height: height,
    alignment: Alignment.center,
    decoration: ShapeDecoration(
      color: const Color(0xFF484848),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    ),
    child: child,
  );

  Widget category(double width, double height) => shapedBox(width, height, null);

  Widget categories() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(110, 110), //const SizedBox(width: 8),
          category(135, 110), //const SizedBox(width: 8),
          category(85, 110),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(135, 110), //const SizedBox(width: 8),
          category(85, 110), //const SizedBox(width: 8),
          category(110, 110),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          category(205, 110), //const SizedBox(width: 8),
          category(135, 110), //const SizedBox(width: 8),
        ],
      ),
    ],
  );
}