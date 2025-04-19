import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_detail/widgets/evolutions/pokemon_evolutions.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_detail/widgets/paint/pokemon_detail_paint.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_detail/widgets/stats/pokemon_stats.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/widgets/image/pokemon_image.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/widgets/name/pokemon_name.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/widgets/types/pokemon_types.dart';
import 'package:go_router/go_router.dart';

/// A stateless widget that displays detailed information about a Pokémon.
///
/// The `PokemonDetailScreen` widget presents various details of a Pokémon,
/// including its image, name, types, stats, and evolutions. It uses a
/// `Stack` to layer a custom paint background and a scrollable column
/// of widgets that display the Pokémon's attributes.
///
/// The widget requires a `PokemonEntity` object to be passed as a parameter,
/// which contains all the necessary data for rendering the Pokémon details.
class PokemonDetailScreen extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => context.pop(),
          backgroundColor: Colors.black,
          mini: true,
          heroTag: null,
          child: Icon(Icons.keyboard_arrow_left),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        body: Stack(
          children: [
            PokemonPaint(pokemonColor: pokemon.color),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      PokemonImage(
                        name: pokemon.name,
                        image: pokemon.image,
                        width: 0.6,
                      ),
                      PokemonName(name: pokemon.name),
                      SizedBox(height: 10.0),
                      PokemonTypes(
                        types: pokemon.types,
                        mainAlignment: MainAxisAlignment.center,
                      ),
                      SizedBox(height: 20.0),
                      PokemonStats(color: pokemon.color, stats: pokemon.stats),
                      SizedBox(height: 20.0),
                      PokemonEvolutions(evolutions: pokemon.evolutions ?? []),
                    ],
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
