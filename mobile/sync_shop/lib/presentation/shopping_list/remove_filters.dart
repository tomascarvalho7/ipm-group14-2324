import 'package:flutter/material.dart';

class RemoveFilters extends StatelessWidget {
  const RemoveFilters({super.key, required this.removeFilters});

  final void Function() removeFilters;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: removeFilters,
      splashColor: Colors.grey.withOpacity(0.5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black.withOpacity(0.2), // Border color
            width: 1, // Border width
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Icon(
          Icons.close,
          size: 25,
          color: Colors.red,
        ),
      ),
    );
  }
}
