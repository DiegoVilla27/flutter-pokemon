import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/widgets/pokemon_info.dart';
import 'package:flutter_pokemon/features/pokemon/presentation/pages/pokemon_search/widgets/pokemon/widgets/pokemon_types.dart';

/// A widget that displays detailed information about a Pokémon.
///
/// The `Pokemon` widget is a stateless widget that takes a `PokemonEntity`
/// object as a parameter and displays its information, including its name,
/// image, and types. The widget uses a gradient background that transitions
/// from black to the Pokémon's specific color. It also includes a hero
/// animation for the Pokémon's image.
///
/// The widget is composed of a `Container` with a gradient background,
/// containing a `Column` with `PokemonInfo` and `PokemonTypes` widgets to
/// display the Pokémon's details. The Pokémon's image is positioned above
/// the container using a `Positioned` widget with a `Hero` animation.
class Pokemon extends StatelessWidget {
  final PokemonEntity pokemon;

  const Pokemon({super.key, required this.pokemon});

  @override
  Widget build(_) {
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
              stops: [0.01, 1.0]
            ),
          ),
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.only(bottom: 16.0),
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
          top: -20,
          right: 10,
          child: Hero(
            tag: pokemon.name,
            child: Image.network(pokemon.image, fit: BoxFit.cover, width: 160)
          ),
        ),
      ],
    );
  }
}
