import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  const RectangularButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.transparent,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: colorScheme.surfaceVariant,
              width: 1.0,
            ),
          color: onPressed != null
              ? colorScheme.surface
              : colorScheme.surface.withOpacity(0.5),
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: onPressed,
          splashColor: Colors.grey.withOpacity(0.5),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 16,
                    color: onPressed != null
                        ? colorScheme.surfaceVariant
                        : colorScheme.surfaceVariant.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
