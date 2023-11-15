import 'package:flutter/cupertino.dart';

Widget logo() => Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Sync',
        style: TextStyle(
          fontSize: 40,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
          foreground: Paint()..shader = const LinearGradient(
            colors: <Color>[Color(0xFF2E7D44), Color.fromRGBO(34, 99, 52, 1.0)],
          ).createShader(const Rect.fromLTWH(0.0, 0.0, 150.0, 70.0))
        ),
      ),
      Text(
          'Shop',
          style: TextStyle(
            color: Color(0xFFEADDD7),
            fontSize: 40,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          )
      )
    ]
);