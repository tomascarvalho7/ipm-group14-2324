import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart' as prov;
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:sync_shop/app-theme.dart';
import 'package:sync_shop/config/create_router.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/providers/user_storage.dart';

import 'config.dart';

Future<void> main() async {
  // Initialize service environment
  await Supabase.initialize(
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
    return prov.MultiProvider(
        providers: [
          prov.Provider<UserStorage>(create: (_) => UserStorage()),
          prov.ProxyProvider<UserStorage, RealService>(
              update: (_, userStorage, __) => RealService(userStorage: userStorage)
          ),
        ],
        child: MaterialApp.router(
          title: 'Sync Shop',
          theme: syncShopLightTheme,
          darkTheme: syncShopDarkTheme,
          routerConfig: createRouter(),
        )
    );
  }
}