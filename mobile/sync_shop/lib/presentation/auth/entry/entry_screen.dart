import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/presentation/auth/utils/confirm_button.dart';
import 'package:sync_shop/presentation/background/background.dart';
import 'package:sync_shop/providers/user_storage.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserStorage>().getUser()
        .then(
            (value) {
              if(value != null) context.go('/lists');
            }
    );

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
                  buildConfirmButtonWidget(context, () {
                    context.push("/signUp");
                  }, "Sign Up"),
                  const SizedBox(height: 16),
                  buildConfirmButtonWidget(context, () {
                    context.push("/logIn");
                  }, "Log In"),
                ],
              )
            ],
          ),
        )));
  }
}
