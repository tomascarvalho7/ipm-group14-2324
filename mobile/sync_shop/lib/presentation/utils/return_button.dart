import 'package:flutter/material.dart';

Widget returnButton(BuildContext context, void Function() onPressed) => FloatingActionButton(
      backgroundColor: Theme.of(context).colorScheme.primary,
      onPressed: onPressed,
      shape: const CircleBorder(),
      child: Icon(Icons.keyboard_arrow_left,
          size: 35, color: Theme.of(context).colorScheme.background),
    );
