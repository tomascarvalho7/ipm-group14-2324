import 'package:flutter/material.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({super.key});

  void _showInfoPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Help',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: const Text(
            'Swipe right to declare an item as bought and swipe left to delete an item.',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
        _showInfoPopup(context);
      },
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
        child: Icon(
          Icons.question_mark,
          size: 25,
          color: colorScheme.surfaceVariant,
        ),
      ),
    );
  }
}
