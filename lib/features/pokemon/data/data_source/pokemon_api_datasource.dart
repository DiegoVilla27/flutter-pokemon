import 'package:dio/dio.dart';
import 'package:flutter_pokemon/features/pokemon/data/models/pokemon_model.dart';

/// Abstract class defining the contract for fetching Pokemon data from an API.
///
/// Methods:
/// - getPokemons: Asynchronously retrieves a list of PokemonModel objects for a given generation.
abstract class PokemonApiDataSource {
  Future<List<PokemonModel>> getPokemons(int generation);
}

/// Implementation of the PokemonApiDataSource interface using Dio for HTTP requests.
/// 
/// This class fetches a list of Pokemon models from a remote JSON API based on the
/// specified generation. It supports fetching data for generation one and two.
/// 
/// Methods:
/// - getPokemons: Retrieves a list of PokemonModel objects for the specified generation.
class PokemonApiDataSourceImpl implements PokemonApiDataSource {
  final Dio dio = Dio();

  @override
  Future<List<PokemonModel>> getPokemons(int generation) async {
    String gen = generation == 1 ? 'one' : 'two';
    final res = await dio.get(
      'https://api-pokemon.s3.eu-north-1.amazonaws.com/generation-$gen.json',
    );
    
    return (res.data as List).map((json) => PokemonModel.fromJson(json)).toList();
  }
}
