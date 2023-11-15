
import 'package:flutter/material.dart';

Widget buildMinorScreenTemplate({required BuildContext context, required Widget child}) =>
    Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 25),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF2E2E2E)),
            child: child
        ),
      ),
    );