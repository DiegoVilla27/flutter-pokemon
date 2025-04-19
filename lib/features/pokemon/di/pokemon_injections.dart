import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/features/pokemon/data/data_source/pokemon_api_datasource.dart';
import 'package:flutter_pokemon/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:flutter_pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';
import 'package:flutter_pokemon/features/pokemon/domain/use_cases/get_pokemons.dart';

/// Initializes dependency injections for the Pokemon feature.
/// 
/// This function registers lazy singletons for the data source, repository,
/// and use case related to Pokemon functionality. It ensures that the
/// `PokemonApiDataSourceImpl`, `PokemonRepositoryImpl`, and `GetPokemonUseCase`
/// are available for dependency injection throughout the application.
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
