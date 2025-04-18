import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

/// A data model class that represents a Pokémon, extending the
/// `PokemonEntity` class. It includes properties such as id, name,
/// height, weight, image, stats, types, color, and evolutions.
///
/// The `PokemonModel` class provides a factory constructor,
/// `fromJson`, which creates an instance of `PokemonModel` from a
/// JSON map. This constructor extracts relevant data from nested
/// JSON structures to populate the model's fields.
class PokemonModel extends PokemonEntity {
  PokemonModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.image,
    required super.stats,
    required super.types,
    required super.color,
    required super.evolutions,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
      id: json['info']['id'],
      name: json['info']['name'],
      height: (json['info']['height'] as num).toDouble(),
      weight: (json['info']['weight'] as num).toDouble(),
      image: json['info']['sprites']['other']['home']['front_default'],
      stats:
          (json['info']['stats'] as List)
              .map((e) => StatsModel.fromJson(e))
              .toList(),
      types:
          (json['info']['types'] as List)
              .map((e) => e['type']['name'].toString())
              .toList(),
      color: List<int>.from(json['color']),
      evolutions:
          (json['evolution_data'] as List)
              .map((e) => PokemonEvolutionModel.fromJson(e))
              .toList(),
    );
  }
}

/// A data model class that represents a Pokémon's evolution, extending
/// the `PokemonEvolutionEntity` class. It includes properties such as
/// id, name, height, weight, image, stats, and types.
///
/// The `PokemonEvolutionModel` class provides a factory constructor,
/// `fromJson`, which creates an instance of `PokemonEvolutionModel` from
/// a JSON map. This constructor extracts relevant data from nested JSON
/// structures to populate the model's fields.
class PokemonEvolutionModel extends PokemonEvolutionEntity {
  PokemonEvolutionModel({
    required super.id,
    required super.name,
    required super.height,
    required super.weight,
    required super.image,
    required super.stats,
    required super.types,
  });

  factory PokemonEvolutionModel.fromJson(Map<String, dynamic> json) {
    return PokemonEvolutionModel(
      id: json['id'],
      name: json['name'],
      height: (json['height'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      image: json['sprites']['other']['home']['front_default'],
      stats:
          (json['stats'] as List).map((e) => StatsModel.fromJson(e)).toList(),
      types: (json['types'] as List).map((e) => e.toString()).toList(),
    );
  }
}

/// A data model class that represents a Pokémon's stats, extending
/// the `StatsEntity` class. It includes properties such as name and
/// value.
///
/// The `StatsModel` class provides a factory constructor, `fromJson`,
/// which creates an instance of `StatsModel` from a JSON map. This
/// constructor extracts the stat name and base stat value from the
/// JSON structure to populate the model's fields.
class StatsModel extends StatsEntity {
  StatsModel({required super.name, required super.value});

  factory StatsModel.fromJson(Map<String, dynamic> json) {
    return StatsModel(name: json['stat']['name'], value: json['base_stat']);
  }
}
