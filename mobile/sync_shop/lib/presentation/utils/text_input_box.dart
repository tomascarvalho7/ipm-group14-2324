import 'package:flutter/material.dart';

class TextInputBox extends StatelessWidget {
  const TextInputBox({super.key, required this.hintText, required this.height});

  final String hintText;
  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(
      height: height,
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          filled: true,
          fillColor: Theme.of(context).colorScheme.background, // Replace bg with your variable for background color
          hintText: hintText,
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
      )

  );
}
