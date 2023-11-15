import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/presentation/new_product/priority_selector.dart';
import 'package:sync_shop/presentation/utils/rectangular_button.dart';
import 'package:sync_shop/presentation/utils/text_input.dart';
import 'package:sync_shop/screen_template.dart';

class NewProcuctScreen extends StatefulWidget {
  const NewProcuctScreen({super.key, required this.listId});

  final int listId;

  @override
  State<NewProcuctScreen> createState() => _NewProcuctScreenState();
}

class _NewProcuctScreenState extends State<NewProcuctScreen> {
  bool _isLoading = false;

  void setIsLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  String _productName = '';

  void setProductName(String value) {
    setState(() {
      debugPrint(value);
      _productName = value;
    });
  }

  List<String> _categories = [];

  void setCategories(List<String> value) {
    setState(() {
      _categories = value;
    });
  }

  int _priority = 0;

  void setPriority(int value) {
    setState(() {
      _priority = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    RealService services = Provider.of<RealService>(context, listen: false);
    return buildScreenTemplateWidget(
        context,
        'New Product',
        showSettingsButton: false,
        [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextInput(
                      hintText: 'New Product Name',
                      onChanged: setProductName,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: RectangularButton(
                      text: 'Categories',
                      onPressed: () {
                        debugPrint('Categories');
                        setCategories(['Fruit']);
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrioritySelector(
                    selectedPriority: _priority,
                    onChanged: setPriority,
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: RectangularButton(
                  text: 'Add Product',
                  onPressed: _productName.isNotEmpty &&
                          _categories.isNotEmpty &&
                          !_isLoading
                      ? () {
                          setIsLoading(true);
                          services
                              .insertProduct(
                            widget.listId,
                            _productName,
                            _categories,
                            _priority,
                          )
                              .then((value) {
                            setIsLoading(false);
                            Navigator.pop(context);
                          });
                        }
                      : null,
                ),
              ),
            ],
          )
        ]);
  }
}
