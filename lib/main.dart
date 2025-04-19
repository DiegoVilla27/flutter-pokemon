import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/core/routes/routes_config.dart';
import 'package:flutter_pokemon/core/theme/theme.dart';

void main() async {
  await initDI();
  runApp(const MyApp());
}

/// A stateless widget that serves as the entry point for the Pokemon App.
///
/// This widget builds a [MaterialApp] configured with custom theme settings
/// and routing configuration. It disables the debug banner and sets the
/// application title to 'Pokemon App'.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(_) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Pokemon App',
      theme: ThemeCustom().get(),
      routerConfig: AppRoutes.router,
    );
  }
}
