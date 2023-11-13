import 'package:flutter/material.dart';

Widget returnButton() => Container(
  width: 50,
  height: 50,
  decoration: const ShapeDecoration(
    color: Color(0xFF2E7D44),
    shape: OvalBorder(),
  ),
  child: const Icon(
      Icons.keyboard_arrow_left,
      size: 40,
      color: Color(0xFF2E2E2E)
  ),
);