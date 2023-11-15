import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_shop/presentation/auth/entry/entry_screen.dart';
import 'package:sync_shop/presentation/auth/log_in/login.dart';
import 'package:sync_shop/presentation/auth/sign_up/signup.dart';
import 'package:sync_shop/presentation/list_selection/list_screen.dart';

GoRouter createRouter() => GoRouter(
    initialLocation: "/",
    routes: [
            GoRoute(
                path: '/',
                builder: (BuildContext context, GoRouterState state) =>
                const EntryScreen()),
            GoRoute(
                path: '/signUp',
                builder: (BuildContext context, GoRouterState state) =>
                SignUpScreen()),
            GoRoute(
                path: '/logIn',
                builder: (BuildContext context, GoRouterState state) =>
                LogInScreen()),
            GoRoute(
                path: '/lists',
                builder: (BuildContext context, GoRouterState state) =>
                const ListSelectionScreen()),
    ]);
