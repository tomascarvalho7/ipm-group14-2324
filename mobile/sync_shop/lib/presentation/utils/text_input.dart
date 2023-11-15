import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    super.key,
    required this.hintText,
    required this.onChanged,
  });

  final String hintText;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return TextField(
      style: TextStyle(
        fontSize: 14.0,
        color: colorScheme.background,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.all(15.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        fillColor: colorScheme.surface,
      ),
      onChanged: onChanged,
    );
  }
}
