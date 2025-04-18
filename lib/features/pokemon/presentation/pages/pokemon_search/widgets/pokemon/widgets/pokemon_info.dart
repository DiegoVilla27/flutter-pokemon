import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/utils/capitalize/capitalize.dart';

/// A widget that displays detailed information about a Pokémon.
///
/// This widget shows the Pokémon's ID, name, weight, and height
/// in a stylized format. The name is capitalized, and the ID is
/// prefixed with a hash symbol. The weight and height are displayed
/// in a row with a semi-transparent background and rounded corners.
///
/// The [pokemon] parameter is required and provides the data to be
/// displayed.
class PokemonInfo extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonInfo({super.key, required this.pokemon});

  @override
  Widget build(_) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "#${pokemon.id.toString()}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
            color: Colors.black,
          ),
        ),
        Text(
          capitalizeWords(pokemon.name),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          spacing: 8.0,
          children: [
            _itemStat("${pokemon.weight} kg"),
            _itemStat("${pokemon.height} m"),
          ],
        ),
      ],
    );
  }

  /// Creates a styled container widget displaying a text title.
  ///
  /// The container has padding, a semi-transparent black background,
  /// and rounded corners. The text is styled with bold font weight.
  ///
  /// [title] is the text to be displayed inside the container.
  Container _itemStat(String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w700)),
    );
  }
}
