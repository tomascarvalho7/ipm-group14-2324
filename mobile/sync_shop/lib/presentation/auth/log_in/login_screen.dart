import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/presentation/auth/utils/clickable_text.dart';
import 'package:sync_shop/presentation/auth/utils/confirm_button.dart';
import 'package:sync_shop/presentation/background/background.dart';
import 'package:sync_shop/providers/feedback_controller.dart';

import '../utils/verifications.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    RealService services = Provider.of<RealService>(context, listen: false);
    FeedbackController feedback = Provider.of<FeedbackController>(context, listen: false);

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: Text('SyncShop',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Theme.of(context).colorScheme.surfaceVariant,
                        fontWeight: FontWeight.bold,
                        fontSize: 64)),
              ),
              Align(
                  alignment: const Alignment(0.0, 0.7),
                  child: Wrap(
                    direction: Axis.vertical,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      SizedBox(
                        width: 303,
                        height: 70,
                        child: TextField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: 'e-mail...',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 15, color: Theme.of(context).colorScheme.surfaceVariant),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.surfaceVariant,
                          ),
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.start,
                          cursorColor: Theme.of(context).colorScheme.surfaceVariant,
                          cursorWidth: 2.0,
                        ),
                      ),
                      SizedBox(
                        width: 303,
                        height: 70,
                        child: TextField(
                          obscureText: !_isPasswordVisible,
                          controller: _passwordController,
                          decoration: InputDecoration(
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                              ),
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.surface,
                            hintText: 'password...',
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontSize: 15, color: Theme.of(context).colorScheme.surfaceVariant),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.secondary,
                                width: 1,
                              ),
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 15,
                            color: Theme.of(context).colorScheme.surfaceVariant,
                          ),
                          maxLines: 1,
                          textAlignVertical: TextAlignVertical.center,
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          textAlign: TextAlign.start,
                          cursorColor: Theme.of(context).colorScheme.surfaceVariant,
                          cursorWidth: 2.0,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      buildConfirmButtonWidget(
                        context,
                        () {
                          String email = _emailController.value.text;
                          String password = _passwordController.value.text;
                          if (verifyEmail(feedback, email, true) && verifyPassword(feedback, password, true)) {
                            services
                                .logIn(email, password)
                                .then(
                                    (value) {
                                      if (value) {
                                        feedback.setSuccessful("Logged in successfully.");
                                        context.go("/lists");
                                      } else {
                                        feedback.setError("Something went wrong.");
                                      }
                                    }
                            );
                          }
                        },
                        'Log In',
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      buildClickableTextWidget(
                        context,
                        () {
                          context.go("/");
                        },
                        "Don't have an account?\nGo back.",
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
