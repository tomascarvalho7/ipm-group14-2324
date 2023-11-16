import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget copyButton(BuildContext context, String content) => ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
    ),
    onPressed: (){
      Clipboard.setData(ClipboardData(text: content));
    },
    child: Row(
      children: [
        Icon(Icons.copy, size: 35, color: Theme.of(context).colorScheme.surface),
        const SizedBox(width: 10),
        Text(
          content,
          style: TextStyle(
            color: Theme.of(context).colorScheme.surface,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    )
);