import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sync_shop/app-theme.dart';
import 'package:sync_shop/config/create_router.dart';
import 'package:sync_shop/data/real_service.dart';
import 'package:sync_shop/presentation/auth/log_in/login.dart';
import 'package:sync_shop/presentation/auth/sign_up/signup.dart';

Future<void> main() async {
  await RealService().load();
  //TODO like this it creates 2 instances of RealServices, should be done with a provider

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
          Provider<RealService>(create: (_) => RealService()),
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