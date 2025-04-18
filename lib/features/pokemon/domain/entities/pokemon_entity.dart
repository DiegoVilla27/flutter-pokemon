/// Represents a Pokémon entity with various attributes such as id, name,
/// height, weight, image, stats, types, color, and evolutions.
///
/// Each Pokémon has a unique identifier, a name, and physical attributes
/// like height and weight. The image field holds a URL or path to the
/// Pokémon's image. The stats list contains the Pokémon's performance
/// metrics, while the types list specifies its elemental types. The color
/// list represents the Pokémon's color scheme using RGB values. The
/// evolutions field is optional and contains a list of Pokémon entities
/// that this Pokémon can evolve into.
class PokemonEntity {
  final int id;
  final String name;
  final double height;
  final double weight;
  final String image;
  final List<StatsEntity> stats;
  final List<String> types;
  final List<int> color;
  final List<PokemonEvolutionEntity>? evolutions;

  PokemonEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.stats,
    required this.types,
    required this.color,
    this.evolutions,
  });
}

/// Represents a Pokémon evolution entity with attributes such as id, name,
/// height, weight, image, stats, types, and color.
///
/// Each Pokémon evolution has a unique identifier, a name, and physical
/// attributes like height and weight. The image field holds a URL or path
/// to the Pokémon's image. The stats list contains the Pokémon's performance
/// metrics, while the types list specifies its elemental types.
class PokemonEvolutionEntity {
  final int id;
  final String name;
  final double height;
  final double weight;
  final String image;
  final List<StatsEntity> stats;
  final List<String> types;

  PokemonEvolutionEntity({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.image,
    required this.stats,
    required this.types,
  });
}

/// A class representing a statistical data point with a name and a value.
///
/// The [Stats] class holds a [name] which is a descriptive label for the data
/// point, and a [value] which is an integer representing the data point's value.
class StatsEntity {
  final String name;
  final int value;

  StatsEntity({required this.name, required this.value});
}
