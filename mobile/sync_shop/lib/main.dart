import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supa;
import 'package:sync_shop/app-theme.dart';
import 'package:sync_shop/config/create_router.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/providers/feedback_controller.dart';
import 'package:sync_shop/providers/user_storage.dart';

import 'config.dart';
import 'domain/provider/categories_controller.dart';

Future<void> main() async {
  // Initialize service environment
  await supa.Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<UserStorage>(create: (_) => UserStorage()),
          ChangeNotifierProvider(create: (_) => FeedbackController()),
          ChangeNotifierProvider(create: (_) => CategoriesController()),
          ProxyProvider<UserStorage, RealService>(
              update: (_, userStorage, __) =>
                  RealService(userStorage: userStorage)),
        ],
        child: MaterialApp.router(
          title: 'SyncShop',
          theme: syncShopLightTheme,
          darkTheme: syncShopDarkTheme,
          routerConfig: createRouter(),
        ));
  }
}
