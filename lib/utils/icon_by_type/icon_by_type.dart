const String assets = "assets/icons/types-pokemon";

/// Returns the file path of the icon corresponding to the given Pokémon type.
/// 
/// The function maps a Pokémon type to its respective SVG icon file path
/// located in the assets directory. If the type is not recognized, an empty
/// string is returned.
/// 
/// [type] is the Pokémon type for which the icon path is requested.
/// 
/// Returns a string representing the file path of the icon.
String iconByType(String type) {
  const Map<String, String> types = {
    "normal": "$assets/normal.svg",
    "fighting": "$assets/fighting.svg",
    "flying": "$assets/flying.svg",
    "poison": "$assets/poison.svg",
    "ground": "$assets/ground.svg",
    "rock": "$assets/rock.svg",
    "bug": "$assets/bug.svg",
    "ghost": "$assets/ghost.svg",
    "steel": "$assets/steel.svg",
    "fire": "$assets/fire.svg",
    "water": "$assets/water.svg",
    "grass": "$assets/grass.svg",
    "electric": "$assets/electric.svg",
    "psychic": "$assets/psychic.svg",
    "ice": "$assets/ice.svg",
    "dragon": "$assets/dragon.svg",
    "dark": "$assets/dark.svg",
    "fairy": "$assets/fairy.svg",
  };

  return types[type] ?? "";
}
