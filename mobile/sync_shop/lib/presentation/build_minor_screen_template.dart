import 'package:flutter/material.dart';

Widget buildMinorScreenTemplate({required BuildContext context, required Widget child}) =>
    Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.background),
            child: child
        ),
      ),
    );
