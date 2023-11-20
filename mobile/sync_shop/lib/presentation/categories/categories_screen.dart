import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/domain/provider/categories_controller.dart';
import 'package:sync_shop/presentation/utils/green_button.dart';
import 'package:sync_shop/presentation/utils/category.dart';
import 'package:sync_shop/screen_template.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) => buildScreenTemplateWidget(
        context,
        'Categories',
        [
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 350, child: categories(context)),
              actionButton(
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.background,
                  "Confirm",
                  onPressed: () {
                CategoriesController controller =
                    context.read<CategoriesController>();
                List<String> categoryLabels = controller.categories
                    .map((e) => categoryToName(e))
                    .toList();
                controller.clear();
                context.pop(categoryLabels);
              }),
            ],
          )
        ],
        showBackground: false,
      );

  Widget categories(BuildContext context) => Consumer<CategoriesController>(
      builder: (_, controller, __) => Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  category(context, Category.bakery, controller, 110, 110),
                  category(
                      context, Category.fruitsVegetables, controller, 135, 110),
                  category(context, Category.dairy, controller, 85, 110),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  category(
                      context, Category.pantryStaples, controller, 115, 110),
                  category(
                      context, Category.generalGoods, controller, 105, 110),
                  category(context, Category.meatFish, controller, 110, 110),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  category(context, Category.householdEssentials, controller,
                      190, 110),
                  category(context, Category.frozenFoods, controller, 140, 110),
                ],
              ),
            ],
          ));
}
