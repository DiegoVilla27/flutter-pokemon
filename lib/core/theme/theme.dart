import 'package:flutter/material.dart';
import 'package:flutter_pokemon/core/theme/colors.dart';
import 'package:flutter_pokemon/core/theme/validations.dart';

/// A custom theme class that manages theme data with a selectable color scheme.
///
/// The [ThemeCustom] class allows for the creation of a theme with a specified
/// color index. It validates the selected color index against the available
/// colors and provides a method to retrieve the corresponding [ThemeData].
///
/// The default color index is 0, and the theme uses a dark brightness setting.
class ThemeCustom {
  late int selectedColor;

  ThemeCustom([this.selectedColor = 6]) {
    validateIndexColor(selectedColor, colorsTheme.length);
  }

  ThemeData get() {
    return ThemeData(
      colorSchemeSeed: colorsTheme[selectedColor],
      brightness: Brightness.dark,
      fontFamily: "Montserrat"
    );
  }
}
