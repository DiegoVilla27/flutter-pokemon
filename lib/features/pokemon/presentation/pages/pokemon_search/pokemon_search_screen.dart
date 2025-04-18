import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/core/routes/routes_names.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/domain/use_cases/get_pokemons.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/pokemon.dart';
import 'package:go_router/go_router.dart';

/// A stateful widget that represents the screen for searching Pokémon.
/// 
/// This widget is responsible for creating the state object
/// that manages the UI and logic for the Pokémon search functionality.
class PokemonSearchScreen extends StatefulWidget {
  const PokemonSearchScreen({super.key});

  @override
  State<PokemonSearchScreen> createState() => _PokemonSearchScreenState();
}

class _PokemonSearchScreenState extends State<PokemonSearchScreen> {
  final getPokemonUseCase = di<GetPokemonUseCase>();

  bool _isLoading = true;
  List<PokemonEntity> _pokemons = [];

  @override
  void initState() {
    super.initState();
    _loadPokemons();
  }

  /// Loads a list of Pokémon asynchronously.
  ///
  /// This method retrieves Pokémon data using the `getPokemonUseCase` and updates
  /// the state with the retrieved list. If the retrieval fails, it updates the
  /// state to indicate that loading is complete without modifying the Pokémon list.
  Future<void> _loadPokemons() async {
    final result = await getPokemonUseCase.repository.getPokemons(1);
    result.fold(
      (failure) {
        setState(() {
          _isLoading = false;
        });
      },
      (pokemons) {
        setState(() {
          _pokemons = pokemons;
          _isLoading = false;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon List")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child:
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: _pokemons.length,
                        itemBuilder: (_, i) {
                          final pokemon = _pokemons[i];
                          return GestureDetector(
                            onTap:
                                () => context.pushNamed(
                                  AppRoutesNamed.pokemonDetail,
                                  extra: pokemon,
                                ),
                            child: Pokemon(pokemon: pokemon),
                          );
                        },
                      ),
                    ),
          ),
        ),
      ),
    );
  }
}
