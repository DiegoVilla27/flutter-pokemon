import 'package:dartz/dartz.dart';
import 'package:flutter_pokemon/core/errors/failure.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

/// An abstract repository interface for fetching Pokémon data.
/// 
/// This repository defines a method to retrieve a list of Pokémon entities
/// from a specified generation. The result is wrapped in an `Either` type,
/// returning a `Failure` on error or a list of `PokemonEntity` on success.
/// 
/// - Parameter generation: The generation number of Pokémon to retrieve.
/// - Returns: A `Future` that resolves to an `Either` containing a `Failure`
///   or a list of `PokemonEntity`.
abstract class PokemonRepository {
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(int generation);
}
