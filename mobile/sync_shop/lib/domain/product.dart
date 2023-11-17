import 'dart:ffi';

class Product {
  Product({
    required this.id,
    required this.listId,
    required this.name,
    required this.date,
    required this.bought,
    required this.categories,
    required this.priority,
  });

  final Int id;
  final Int listId;
  final String name;
  final DateTime date;
  final bool bought;
  final List<String> categories;
  final Int priority;
}
