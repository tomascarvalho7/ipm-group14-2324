import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/new_product.dart/priority_selector.dart';
import 'package:sync_shop/presentation/utils/rectangular_button.dart';
import 'package:sync_shop/presentation/utils/text_input.dart';
import 'package:sync_shop/screen_template.dart';

class NewProcuctScreen extends StatelessWidget {
  const NewProcuctScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return buildScreenTemplateWidget(context, 'New Product', [
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const TextInput(hintText: 'New Product Name'),
          ),
          Container(
            width: double.infinity,
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: RectangularButton(
              text: 'Categories',
              onPressed: () => debugPrint('Categories'),
            ),
          ),
          const PrioritySelector(),
          SizedBox(
            height: 50,
            child: RectangularButton(
              text: 'Add Product',
              onPressed: () => debugPrint('Add'),
            ),
          ),
        ],
      )
    ]);
  }
}
