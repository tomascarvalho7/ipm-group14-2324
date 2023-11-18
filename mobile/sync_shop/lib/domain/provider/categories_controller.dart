
import 'package:flutter/cupertino.dart';

class CategoriesController with ChangeNotifier {
  List<Category> categories = List.empty();

  bool isSelected(Category category) => categories.contains(category);

  void interact(Category category) {
    if (isSelected(category)) {
      remove(category);
    } else {
      add(category);
    }

    notifyListeners();
  }

  void remove(Category category) {
    categories = List<Category>.from(categories)..remove(category);
  }

  void add(Category category) {
    categories = [...categories, category];
  }
}

enum Category {
  generalGoods,
  dairy,
  meatFish,
  fruitsVegetables,
  pantryStaples,
  bakery,
  frozenFoods,
  householdEssentials
}