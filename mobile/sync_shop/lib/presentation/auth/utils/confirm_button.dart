import 'package:flutter/material.dart';

Widget buildConfirmButtonWidget(
    BuildContext context, Function() onTap, String text) =>
    ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).colorScheme.background,
        minimumSize: const Size(250, 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge?.
        copyWith(
          color: Theme.of(context).colorScheme.surface
        ),
      ),
    );
