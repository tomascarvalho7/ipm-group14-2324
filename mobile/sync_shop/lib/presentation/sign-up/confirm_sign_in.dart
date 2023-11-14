import 'package:flutter/material.dart';

Widget buildConfirmSignInWidget(
    BuildContext context, Function() onTap, String text) =>
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        minimumSize: const Size(250, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    );
