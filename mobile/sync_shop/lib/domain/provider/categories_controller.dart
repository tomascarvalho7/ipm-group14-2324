
import 'package:flutter/cupertino.dart';

class CategoriesController with ChangeNotifier {
  List<Category> categories = List.empty();

  bool isSelected(Category category) => categories.contains(category);

  void clear() {
    categories = [];

    notifyListeners();
  }

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

String categoryToName(Category category) {
  if (category == Category.generalGoods) return "General Goods";
  if (category == Category.dairy) return "Dairy";
  if (category == Category.meatFish) return "Meat & Fish";
  if (category == Category.fruitsVegetables) return "Fruits & Vegetables";
  if (category == Category.pantryStaples) return "Pantry Staples";
  if (category == Category.bakery) return "Bakery";
  if (category == Category.frozenFoods) return "Frozen Foods";
  else return "Household Essentials";
}

String categoryToImage(Category category) {
  if (category == Category.generalGoods) return "assets/generalItems.png";
  if (category == Category.dairy) return "assets/dairy.png";
  if (category == Category.meatFish) return "assets/meatNFish.png";
  if (category == Category.fruitsVegetables) return "assets/foodsNVegetables.png";
  if (category == Category.pantryStaples) return "assets/pantryStaples.png";
  if (category == Category.bakery) return "assets/bakery.png";
  if (category == Category.frozenFoods) return "assets/frozen_foods.png";
  else return "assets/household_essentials.png";
}