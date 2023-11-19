import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget greenButton(Color textColor, {required Function() onPressed}) =>
    Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: SizedBox(
            height: 75,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2E7D44),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text(
                  'Confirm',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 40,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ))));
