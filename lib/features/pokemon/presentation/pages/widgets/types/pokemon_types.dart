import 'package:flutter/material.dart';
import 'package:flutter_pokemon/utils/capitalize/capitalize.dart';
import 'package:flutter_pokemon/utils/color_by_type/color_by_type.dart';
import 'package:flutter_pokemon/utils/icon_by_type/icon_by_type.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a list of Pokémon types as styled containers.
///
/// The `PokemonTypes` widget takes a list of Pokémon type strings and displays
/// each type in a styled container with an icon and capitalized text. The
/// alignment of the row can be customized using the `alignment` parameter.
///
/// The widget uses organization-specific utilities to determine the color and
/// icon for each Pokémon type, ensuring consistent styling across the app.
///
/// Parameters:
/// - `types`: A list of strings representing Pokémon types.
/// - `mainAlignment`: Determines the alignment of the row containing the type widgets.
class PokemonTypes extends StatelessWidget {
  final List<String> types;
  final MainAxisAlignment mainAlignment;

  const PokemonTypes({super.key, required this.types, required this.mainAlignment});

  @override
  Widget build(_) {
    return Row(
      mainAxisAlignment: mainAlignment,
      spacing: 8.0,
      children: types.map((type) => _itemType(type)).toList(),
    );
  }

  Container _itemType(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: Color(colorByType(type)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        spacing: 5.0,
        children: [
          SvgPicture.asset(iconByType(type), height: 14.0),
          Text(
            capitalizeWords(type),
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
