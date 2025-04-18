import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/widgets/pokemon_info.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/widgets/pokemon_types.dart';

/// A stateless widget that displays a Pokémon's details with a gradient background.
///
/// The `Pokemon` widget takes a `PokemonEntity` object and displays its
/// information, including name, image, and types. It features a gradient
/// background transitioning from black to the Pokémon's specific color.
/// The widget includes a hero animation for the Pokémon's image, which is
/// positioned above the container. The layout consists of a `Stack` with
/// a `Container` for the background and a `Column` for displaying the
/// `PokemonInfo` and `PokemonTypes` widgets.
class Pokemon extends StatelessWidget {
  final PokemonEntity pokemon;

  const Pokemon({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    Color pokemonColor = Color.fromRGBO(
      pokemon.color[0],
      pokemon.color[1],
      pokemon.color[2],
      1,
    );

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20.0),
            gradient: LinearGradient(
              colors: [Colors.black, pokemonColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.01, 1.0],
            ),
          ),
          padding: EdgeInsets.all(12.0),
          margin: EdgeInsets.only(bottom: 12.0),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PokemonInfo(pokemon: pokemon),
              SizedBox(height: 8.0),
              PokemonTypes(types: pokemon.types),
            ],
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withAlpha(5),
            ),
          ),
        ),
        Positioned(
          top: -20,
          right: 10,
          child: Hero(
            tag: pokemon.name,
            child: Image.network(
              pokemon.image,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width * 0.4,
            ),
          ),
        ),
      ],
    );
  }
}
