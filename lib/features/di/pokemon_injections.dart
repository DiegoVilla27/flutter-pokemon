import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/features/pokemon/data/data_source/pokemon_api_datasource.dart';
import 'package:flutter_pokemon/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/features/pokemon/domain/use_cases/get_pokemons.dart';

Future<void> initPokemonInjections() async {
  // Data sources
  di.registerLazySingleton<PokemonApiDataSourceImpl>(
    () => PokemonApiDataSourceImpl(),
  );

  // Repository
  di.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(pokemonDataSourceImpl: di()),
  );

  // UseCase
  di.registerLazySingleton<GetPokemonUseCase>(
    () => GetPokemonUseCase(repository: di()),
  );
}
