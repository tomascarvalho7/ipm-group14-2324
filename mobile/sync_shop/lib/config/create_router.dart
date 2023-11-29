import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sync_shop/presentation/auth/entry/entry_screen.dart';
import 'package:sync_shop/presentation/auth/log_in/login_screen.dart';
import 'package:sync_shop/presentation/auth/sign_up/signup_screen.dart';
import 'package:sync_shop/presentation/categories/categories_screen.dart';
import 'package:sync_shop/presentation/list_selection/list_screen.dart';
import 'package:sync_shop/presentation/new_product/new_product_screen.dart';
import 'package:sync_shop/presentation/settings/settings_screen.dart';
import 'package:sync_shop/presentation/shopping_list/shopping_list_screen.dart';

import '../presentation/overlay_widget.dart';

GoRouter createRouter() => GoRouter(initialLocation: "/", routes: [
    ShellRoute(
      builder: (context, state, child) {
        return OverlayWidget(child: child);
      },
        routes: [
          GoRoute(
              path: '/',
              builder: (BuildContext context, GoRouterState state) =>
              const EntryScreen()),
          GoRoute(
              path: '/signUp',
              builder: (BuildContext context, GoRouterState state) =>
              const SignUpScreen()),
          GoRoute(
              path: '/logIn',
              builder: (BuildContext context, GoRouterState state) =>
              const LogInScreen()),
          GoRoute(
              path: '/categories',
              builder: (BuildContext context, GoRouterState state) =>
              const CategoriesScreen()),
          GoRoute(
              path: '/list/:listId/settings',
              builder: (BuildContext context, GoRouterState state) {
                final listId = int.parse(state.params['listId']!);
                return SettingsScreen(listId: listId);
              }),
          GoRoute(
              path: '/lists',
              builder: (BuildContext context, GoRouterState state) {
                final shouldUpdate = state.extra == null ? false : true;
                return ListSelectionScreen(shouldUpdate: shouldUpdate);
              }),
          GoRoute(
            path: '/lists/:listId',
            builder: (BuildContext context, GoRouterState state) {
              final listId = int.parse(state.params['listId']!);
              final listName = state.extra as String;
              return ShoppingListScreen(listId: listId, listName: listName);
            },
          ),
          GoRoute(
            path: '/lists/:listId/newProduct',
            builder: (BuildContext context, GoRouterState state) {
              final listId = int.parse(state.params['listId']!);
              return NewProcuctScreen(listId: listId);
            },
          )
        ]
    ),
    ]);
