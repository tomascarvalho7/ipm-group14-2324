import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function() onTap;

  const Button({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Change the color as needed
          borderRadius: BorderRadius.circular(20.0), // Adjust the border radius
        ),
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white, // Change the text color as needed
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
