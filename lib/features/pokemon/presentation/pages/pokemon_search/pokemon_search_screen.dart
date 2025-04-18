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
  final ScrollController _controller = ScrollController();

  bool _isLoading = true;
  bool _showFAB = false;
  List<PokemonEntity> _pokemons = [];

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

  /// Toggles the visibility of the Floating Action Button (FAB) based on the scroll offset.
  ///
  /// The FAB is shown when the scroll offset exceeds a predefined trigger value
  /// and hidden when it is below or equal to that value.
  void _toggleFAB() {
    const double offsetTrigger = 600.0;

    if (_controller.offset > offsetTrigger && !_showFAB) {
      setState(() => _showFAB = true);
    } else if (_controller.offset <= offsetTrigger && _showFAB) {
      setState(() => _showFAB = false);
    }
  }

  /// Scrolls the view to the top with an animation.
  ///
  /// The animation duration is set to 400 milliseconds and uses
  /// an ease-in-out curve for a smooth transition.
  void _scrollTop() {
    _controller.animateTo(
      0,
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon List")),
      floatingActionButton:
          _showFAB
              ? FloatingActionButton(
                onPressed: _scrollTop,
                mini: true,
                backgroundColor: Colors.black,
                child: Icon(Icons.arrow_drop_up),
              )
              : null,
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
                        controller: _controller,
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
