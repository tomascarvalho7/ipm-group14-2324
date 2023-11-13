import 'package:flutter/cupertino.dart';

Widget greenButton() => Container(
  width: double.infinity,
  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(
          width: double.infinity,
          height: 75,
          decoration: ShapeDecoration(
            color: const Color(0xFF2E7D44),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          alignment: Alignment.center,
          child: Text(
            'Confirm',
            style: TextStyle(
              color: Color(0xFF2E2E2E),
              fontSize: 40,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          )
      )
    ],
  ),
);