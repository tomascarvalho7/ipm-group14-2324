import 'package:flutter/cupertino.dart';

Widget textFormat(String data, Color color, double size) =>
    Text(
      data,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.w400,
      ),
    );