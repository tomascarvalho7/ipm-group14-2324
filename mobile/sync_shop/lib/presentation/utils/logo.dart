import 'package:flutter/cupertino.dart';

Widget logo() => const Row(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text(
        'Sync',
        style: TextStyle(
          color: Color(0xFF2E7D44),
          fontSize: 40,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          height: 0,
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