import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/domain/provider/categories_controller.dart';
import 'package:sync_shop/presentation/build_minor_screen_template.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/logo.dart';
import 'package:sync_shop/presentation/utils/category.dart';

import '../utils/return_button.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) =>
      buildMinorScreenTemplate(
          context: context,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              SizedBox(
                  height: 350,
                  child: categories(context)
              ),
              greenButton(onPressed: () => context.pop()),
            ],
          )
      );

  Widget categories(BuildContext context) => Consumer<CategoriesController>(
    builder: (_, controller, __) => Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            category(context, Category.dairy, controller, 110, 110),
            category(context, Category.bakery, controller, 135, 110),
            category(context, Category.frozenFoods, controller, 85, 110),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            category(context, Category.householdEssentials, controller, 135, 110),
            category(context, Category.meat, controller, 85, 110),
            category(context, Category.pantryStaples, controller, 110, 110),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            category(context, Category.produce, controller, 200, 110),
            category(context, Category.produce, controller, 135, 110),
          ],
        ),
      ],
    )
  );
}