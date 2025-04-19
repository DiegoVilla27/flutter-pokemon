import 'package:flutter/material.dart';

/// A widget that displays a Pokémon image with a hero animation.
///
/// This widget takes a Pokémon's name, image URL, and a width factor to
/// display the image. The image is fetched from the network and displayed
/// with a cover fit. The width of the image is determined by multiplying
/// the screen width by the provided width factor.
///
/// The widget uses a [Hero] widget for smooth transitions between routes,
/// using the Pokémon's name as the hero tag.
///
/// Parameters:
/// - `name`: The name of the Pokémon, used as the hero tag.
/// - `image`: The URL of the Pokémon's image.
/// - `width`: A factor to determine the width of the image relative to
///   the screen width.
class PokemonImage extends StatelessWidget {
  final String name;
  final String image;
  final double width;

  const PokemonImage({
    super.key,
    required this.name,
    required this.image,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: name,
      child: Image.network(
        image,
        fit: BoxFit.cover,
        width: MediaQuery.of(context).size.width * width,
      ),
    );
  }
}
