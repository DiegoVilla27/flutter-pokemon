import 'package:flutter_pokemon/features/di/pokemon_injections.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

Future<void> initDI() async {
  // Features
  await initPokemonInjections();
}
