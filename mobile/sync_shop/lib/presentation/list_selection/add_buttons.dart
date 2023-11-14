import 'package:flutter/material.dart';

class ListButton extends StatelessWidget {
  final String text;
  final VoidCallback onClick;

  const ListButton({
    Key? key,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.4,
      heightFactor: 0.1,
      child: ElevatedButton(
        onPressed: onClick,
        child: Text(
            text,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}