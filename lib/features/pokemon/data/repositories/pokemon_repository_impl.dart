import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pokemon/core/errors/failure.dart';
import 'package:flutter_pokemon/features/pokemon/data/data_source/pokemon_api_datasource.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/domain/repositories/pokemon_repository.dart';

/// Implementation of the PokemonRepository interface that provides methods
/// to fetch Pokemon data from a data source.
///
/// This class uses a PokemonApiDataSourceImpl to retrieve a list of Pokemon
/// entities based on the specified generation. It handles exceptions
/// related to network requests using Dio and returns either a list of
/// PokemonEntity objects or a Failure object in case of an error.
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonApiDataSourceImpl pokemonDataSourceImpl;

  PokemonRepositoryImpl({required this.pokemonDataSourceImpl});

  @override
  Future<Either<Failure, List<PokemonEntity>>> getPokemons(
    int generation,
  ) async {
    try {
      final List<PokemonEntity> res = await pokemonDataSourceImpl.getPokemons(
        generation,
      );
      return Right(res);
    } on DioException {
      return Left(FailureServer());
    }
  }
}
