import 'package:flutter_pokemon/features/pokemon/di/pokemon_injections.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

/// Initializes the dependency injection (DI) system for the application.
///
/// This function sets up the necessary dependencies for various features
/// by invoking their respective initialization functions. Currently, it
/// initializes the dependencies required for the Pokemon feature.
Future<void> initDI() async {
  // Features
  await initPokemonInjections();
}
