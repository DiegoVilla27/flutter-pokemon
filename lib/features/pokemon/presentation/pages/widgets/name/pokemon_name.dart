import 'package:flutter/material.dart';
import 'package:flutter_pokemon/utils/capitalize/capitalize.dart';

/// A widget that displays a Pokémon's name with a stylized appearance.
///
/// The `PokemonName` widget takes a required `name` parameter, which is a
/// string representing the Pokémon's name. The name is displayed in a
/// bold, large font with a white color and a shadow effect for emphasis.
///
/// The text is capitalized using the `capitalizeWords` utility function
/// to ensure proper formatting.
class PokemonName extends StatelessWidget {
  final String name;

  const PokemonName({super.key, required this.name});

  @override
  Widget build(_) {
    return Text(
      capitalizeWords(name),
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 28.0,
        color: Colors.white,
        shadows: [
          Shadow(
            offset: Offset(3, 3), // Shadow shift
            blurRadius: 4.0, // Blur
            color: Colors.black.withAlpha(128), // Opacity color
          ),
        ],
      ),
    );
  }
}
