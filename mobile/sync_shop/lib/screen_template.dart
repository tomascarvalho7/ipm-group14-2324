import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/background/background.dart';
import 'package:sync_shop/presentation/utils/logo.dart';

Widget buildScreenTemplateWidget(
        BuildContext context, String title, List<Widget> childWidgets) =>
    Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Background(
          child: Container(
            margin: const EdgeInsets.all(10),
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
                              Container(
                                margin: const EdgeInsets.all(0),
                                child: Icon(
                                  Icons.arrow_circle_left_outlined,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                              const SizedBox(width: 10),
                              logo()
                            ],
                          ),
                          Icon(
                            Icons.more_horiz,
                            size: 40,
                            color: Theme.of(context).colorScheme.secondary,
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 64),
                        child: Text(
                          title,
                          style: const TextStyle(
                            color: Color(0xFFA89780),
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
        )
      ),
    );
