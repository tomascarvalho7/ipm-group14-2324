import 'package:flutter/material.dart';

Widget actionButton(Color color, String content, BuildContext context,
        {required Function() onPressed}) =>
    SizedBox(
      width: 200,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          content,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
