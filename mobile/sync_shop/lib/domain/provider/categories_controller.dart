
import 'package:flutter/cupertino.dart';

class CategoriesController with ChangeNotifier {
  List<Category> categories = List.empty();

  bool isSelected(Category category) => categories.contains(category);

  void add(Category category) {
    if (isSelected(category)) return;

    categories = [...categories, category];
    notifyListeners();
  }
}

enum Category {
  produce,
  dairy,
  meat,
  pantryStaples,
  bakery,
  frozenFoods,
  householdEssentials
}