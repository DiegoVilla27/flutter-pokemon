import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon/core/errors/failure.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

/// A use case class responsible for retrieving a list of Pokémon entities
/// from the repository based on the specified generation.
///
/// The [GetPokemonUseCase] class interacts with the [PokemonRepository]
/// to fetch Pokémon data. It returns a [Future] that resolves to an
/// [Either] containing a [Failure] or a list of [PokemonEntity] objects.
///
/// The [call] method requires an integer [generation] parameter to
/// specify which generation of Pokémon to retrieve.
class GetPokemonUseCase {
  final PokemonRepository repository;

  GetPokemonUseCase({required this.repository});

  Future<Either<Failure, List<PokemonEntity>>> call(int generation) {
    return repository.getPokemons(generation);
  }
}
