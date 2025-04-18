import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/di/injection.dart';
import 'package:flutter_pokemon/core/routes/routes_names.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/domain/use_cases/get_pokemons.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/pokemon.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/search/pokemon_search.dart';
import 'package:flutter_pokemon/utils/scroll_top/scroll_top.dart';
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
  final ScrollController _controller = ScrollController();

  bool _isLoading = true;
  bool _showFAB = false;
  List<PokemonEntity> _pokemons = [];
  List<PokemonEntity> _pokemonsFiltered = [];

  @override
  void initState() {
    super.initState();
    _loadPokemons();
    _controller.addListener(_toggleFAB);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Loads Pokémon data for a specified generation asynchronously.
  ///
  /// This method updates the UI state to indicate loading, retrieves Pokémon
  /// data for the given generation using the repository, and updates the UI
  /// state with the results or handles any failures.
  ///
  /// [generation] The generation of Pokémon to load. Defaults to 1.
  Future<void> _loadPokemons([int generation = 1]) async {
    setState(() => _isLoading = true);
    final result = await getPokemonUseCase.repository.getPokemons(generation);
    result.fold(
      (failure) => setState(() => _isLoading = false),
      (pokemons) => setState(() {
        _pokemons = pokemons;
        _pokemonsFiltered = pokemons;
        _isLoading = false;
      }),
    );
  }

  /// Toggles the visibility of the Floating Action Button (FAB) based on the
  /// scroll offset of the controller. If the offset exceeds the defined
  /// threshold, the FAB is shown or hidden accordingly.
  void _toggleFAB() {
    const double offsetTrigger = 600.0;
    final bool shouldShowFAB = _controller.offset > offsetTrigger;

    if (_showFAB != shouldShowFAB) {
      setState(() => _showFAB = shouldShowFAB);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:
          _showFAB
              ? FloatingActionButton(
                onPressed: () => scrollToTop(_controller),
                mini: true,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_drop_up),
              )
              : null,
      body: SafeArea(
        child: Column(
          children: [
            PokemonSearch(
              pokemonsAll: _pokemons,
              onPokemonsFiltered:
                  (pokemons) => setState(() => _pokemonsFiltered = pokemons),
              changeGeneration: (gen) => _loadPokemons(gen),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child:
                      _isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                            height: MediaQuery.of(context).size.height,
                            child: ListView.builder(
                              controller: _controller,
                              itemCount: _pokemonsFiltered.length,
                              itemBuilder: (_, i) {
                                return GestureDetector(
                                  onTap:
                                      () => context.pushNamed(
                                        AppRoutesNamed.pokemonDetail,
                                        extra: _pokemonsFiltered[i],
                                      ),
                                  child: Pokemon(pokemon: _pokemonsFiltered[i]),
                                );
                              },
                            ),
                          ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
