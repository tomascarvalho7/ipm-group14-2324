import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RectangularButton(
      {super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the desired width
      height: 50, // Set the desired height
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                10), // Adjust the radius for rounded edges
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16,
              color: Colors.black), // Adjust the text size if needed
        ),
      ),
    );
  }
}
