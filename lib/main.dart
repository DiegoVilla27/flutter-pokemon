import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/core/routes/routes_config.dart';
import 'package:flutter_pokemon/core/theme/theme.dart';

void main() async {
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeCustom().get(),
      routerConfig: AppRoutes.router,
    );
  }
}
