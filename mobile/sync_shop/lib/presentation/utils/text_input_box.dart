import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  const TextInputBox({super.key, required this.hintText, required this.height, required this.onChange});

  final String hintText;
  final double height;
  final Function(String) onChange;

  @override
  Widget build(BuildContext context) => Container(
      height: height,
      decoration: ShapeDecoration(
        shape: const RoundedRectangleBorder(),
        shadows: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        // input
        onChanged: (String name) => onChange(name),
        // decoration
        cursorColor: Theme.of(context).colorScheme.primary,
        style: TextStyle(
            fontSize: 22,
            color: Theme.of(context).colorScheme.surfaceVariant
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.surface, // Replace bg with your variable for background color
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.surfaceVariant),
          contentPadding: const EdgeInsets.all(15.0),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 7.5),
            borderRadius: BorderRadius.circular(3)
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 7.5),
            borderRadius: BorderRadius.circular(3)
          ),
        ),
      ),
  );
}
