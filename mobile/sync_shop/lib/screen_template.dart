import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/background/background.dart';
import 'package:sync_shop/presentation/utils/logo.dart';

Widget buildScreenTemplateWidget(
  BuildContext context,
  String title,
  List<Widget> childWidgets, {
  bool showBackButton = true,
  bool showSettingsButton = true,
}) {
  ColorScheme colorScheme = Theme.of(context).colorScheme;
  return Scaffold(
    backgroundColor: colorScheme.background,
    body: SafeArea(
        child: Background(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
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
                              ? Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 40,
                                  color: colorScheme.surface,
                                )
                              : Container(),
                          showBackButton
                              ? const SizedBox(width: 10)
                              : Container(),
                          logo()
                        ],
                      ),
                      showSettingsButton
                          ? Icon(
                              Icons.more_horiz,
                              size: 40,
                              color: colorScheme.surface,
                            )
                          : Container(),
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
            ]),
      ),
    )),
  );
}
