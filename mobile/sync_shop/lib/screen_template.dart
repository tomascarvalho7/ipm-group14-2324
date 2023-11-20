import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_shop/presentation/background/background.dart';
import 'package:sync_shop/presentation/utils/logo.dart';

Widget buildScreenTemplateWidget(
  BuildContext context,
  String title,
  List<Widget> childWidgets, {
  bool showBackground = true,
  bool showBackButton = true,
  String? settingsRoute,
  VoidCallback? settingsAction,
  bool resizeToAvoidBottomInset = true,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;

  Widget screen = Container(
    margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    showBackButton
                        ? ReturnBackButton(onPressed: (ctx) => ctx.pop())
                        : Container(),
                    logo(context)
                  ],
                ),
                settingsRoute != null
                    ? IconButton(
                        icon: const Icon(
                          Icons.more_horiz,
                        ),
                        color: colorScheme.surfaceVariant,
                        iconSize: 40,
                        onPressed: () =>
                            context.push(settingsRoute).then((value) {
                          settingsAction!();
                        }),
                      )
                    : Container()
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                title,
                style: TextStyle(
                  color: colorScheme.secondary,
                  fontSize: 30,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        Expanded(child: Stack(children: childWidgets)),
      ],
    ),
  );

  return Scaffold(
    backgroundColor: colorScheme.background,
    resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    body: SafeArea(
      child: showBackground ? Background(child: screen) : screen,
    ),
  );
}

class ReturnBackButton extends StatelessWidget {
  const ReturnBackButton({super.key, required this.onPressed});

  final void Function(BuildContext ctx) onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 35,
      height: 35,
      margin: const EdgeInsets.only(right: 10),
      child: FloatingActionButton(
        heroTag: 'backButton',
        backgroundColor: Theme.of(context).colorScheme.surface,
        onPressed: () => onPressed(context),
        shape: const CircleBorder(),
        child: Icon(Icons.keyboard_arrow_left,
            size: 35, color: Theme.of(context).colorScheme.surfaceVariant),
      ),
    );
  }
}
