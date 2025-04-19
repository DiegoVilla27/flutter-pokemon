/// Returns the formatted name of a given stat.
///
/// Takes a [name] as input, which is a key representing a stat,
/// and returns the corresponding formatted stat name from a predefined map.
/// If the [name] is not found in the map, an empty string is returned.
String statName(String name) {
  const Map<String, String> stats = {
    "hp": "Hp",
    "attack": "Attack",
    "defense": "Defense",
    "special-attack": "Sp. Atk",
    "special-defense": "Sp. Def",
    "speed": "Speed",
  };

  return stats[name] ?? "";
}
