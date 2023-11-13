import 'package:flutter/material.dart';

Widget returnButton() => Container(
      width: 40,
      height: 40,
      decoration: const ShapeDecoration(
        color: Color(0xFF2E7D44),
        shape: OvalBorder(),
      ),
      child: const Icon(Icons.keyboard_arrow_left,
          size: 30, color: Color(0xFF2E2E2E)),
    );
