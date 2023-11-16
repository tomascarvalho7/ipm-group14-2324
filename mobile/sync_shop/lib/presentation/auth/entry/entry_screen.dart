import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_shop/presentation/auth/utils/confirm_button.dart';
import 'package:sync_shop/presentation/background/background.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Background(
          child: Align(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: Image.asset(
                    'assets/SyncShopIcon.png',
                    width: 250,
                    height: 250,
                  ),
                ),
                Column(
                  children: [
                    buildConfirmButtonWidget(
                        context,
                            () {
                          context.go("/signUp");
                        },
                        "Sign Up"),
                    const SizedBox(height: 16),
                    buildConfirmButtonWidget(
                        context,
                            () {
                          context.go("/logIn");
                        },
                        "Log In"),
                  ],
                )
              ],
            ),
          )
        )
    );
  }
}
