import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonDetailScreen extends StatelessWidget {
  final PokemonEntity pokemon;

  const PokemonDetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Text(pokemon.name);
  }
}
