import 'package:flutter/widgets.dart';
import 'package:sync_shop/presentation/new_product.dart/button.dart';
import 'package:sync_shop/screen_template.dart';

class NewProcuctScreen extends StatelessWidget {
  const NewProcuctScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTemplate(
        child: Column(children: [
      const Text('New Product'),
      Button(text: 'Add', onTap: () => debugPrint('Add')),
    ]));
  }
}
