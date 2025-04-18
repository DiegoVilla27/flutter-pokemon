import 'package:flutter/material.dart';
import 'package:flutter_pokemon/utils/capitalize/capitalize.dart';
import 'package:flutter_pokemon/utils/color_by_type/color_by_type.dart';
import 'package:flutter_pokemon/utils/icon_by_type/icon_by_type.dart';
import 'package:flutter_svg/svg.dart';

/// A widget that displays a list of Pokémon types as styled containers.
///
/// Each type is represented by a container with a background color and icon
/// specific to the type. The type name is displayed in capitalized form with
/// bold text.
///
/// The widget takes a list of type strings and maps each to a styled container
/// using the `_itemType` method.
/// 
/// This will display two containers, one for 'fire' and one for 'water', each
/// with their respective colors and icons.
class PokemonTypes extends StatelessWidget {
  final List<String> types;

  const PokemonTypes({super.key, required this.types});

  @override
  Widget build(_) {
    return Row(
      spacing: 8.0,
      children: types.map((type) => _itemType(type)).toList(),
    );
  }

  Container _itemType(String type) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: Color(colorByType(type)),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        spacing: 5.0,
        children: [
          SvgPicture.asset(iconByType(type), height: 16.0,),
          Text(capitalizeWords(type), style: TextStyle(fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }
}
