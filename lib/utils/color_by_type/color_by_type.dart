/// Returns the color code associated with a given type.
///
/// The function takes a string `type` as input and returns an integer
/// representing the color code for that type. If the type is not found
/// in the predefined map, it returns a default color code of black
/// (0xFF000000).
///
/// - Parameter type: The type for which to retrieve the color code.
/// - Returns: The color code as an integer.
int colorByType(String type) {
  const Map<String, int> types = {
    "normal": 0xFFA0A29F,
    "fighting": 0xFFD14461,
    "flying": 0xFFA2BCEA,
    "poison": 0xFFB667CD,
    "ground": 0xFFD87C52,
    "rock": 0xFFC9BB8D,
    "bug": 0xFF93BB3A,
    "ghost": 0xFF606FBA,
    "steel": 0xFF5995A2,
    "fire": 0xFFF9A555,
    "water": 0xFF579EDD,
    "grass": 0xFF63BC5D,
    "electric": 0xFFF1D85A,
    "psychic": 0xFFED93E4,
    "ice": 0xFF79D0C1,
    "dragon": 0xFF176CC5,
    "dark": 0xFF595761,
    "fairy": 0xFFF88684,
  };

  return types[type] ?? 0xFF000000;
}
