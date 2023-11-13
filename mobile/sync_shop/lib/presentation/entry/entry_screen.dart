import 'package:flutter/material.dart';
import 'package:sync_shop/presentation/utils/rectangular_button.dart';

class EntryScreen extends StatelessWidget {
  const EntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/SyncShopIcon.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 32),
            RectangularButton(
              text: "Login",
              onPressed: () {
                // TODO: Go to LoginScreen
              },
            ),
            const SizedBox(height: 16),
            RectangularButton(
              text: "Sign Up",
              onPressed: () {
                // TODO: Go to SignUpScreen
              },
            ),
          ],
        ),
      ),
    );
  }
}
