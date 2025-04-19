import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

/// A widget that displays a horizontal list of Pokémon evolutions.
///
/// This widget takes a list of `PokemonEvolutionEntity` objects and
/// displays their images in a horizontally scrollable row. It is
/// designed to fit within a fixed height of 100.0 pixels.
///
/// The `evolutions` parameter is required and should contain the
/// evolution data to be displayed.
class PokemonEvolutions extends StatelessWidget {
  final List<PokemonEvolutionEntity> evolutions;

  const PokemonEvolutions({super.key, required this.evolutions});

  @override
  Widget build(_) {
    return SizedBox(
      height: 100.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                evolutions.map((evolution) {
                  return Image.network(evolution.image);
                }).toList(),
          ),
        ],
      ),
    );
  }
}
