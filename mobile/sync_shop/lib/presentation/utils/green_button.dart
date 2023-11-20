import 'package:flutter/material.dart';

Widget actionButton(Color color, Color textColor, String content, {required Function() onPressed}) =>
    Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SizedBox(
            height: 70,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  content,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ))));
