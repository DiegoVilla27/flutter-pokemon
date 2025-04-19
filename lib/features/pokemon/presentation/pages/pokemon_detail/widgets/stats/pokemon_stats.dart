import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:flutter_pokemon/utils/stat_name/stat_name.dart';

/// A widget that displays a list of Pokémon stats with their names, values,
/// and corresponding progress bars.
///
/// The [PokemonStats] widget takes a list of [StatsEntity] objects and a
/// color list to render each stat's name, value, and a progress bar. The
/// progress bar visually represents the stat value using the specified color.
/// Each stat is displayed in a row with the name and value aligned
/// horizontally. The widget uses a [Column] to stack the rows vertically.
///
/// The [color] parameter should be a list of three integers representing
/// the RGB values for the progress bar color.
class PokemonStats extends StatelessWidget {
  final List<int> color;
  final List<StatsEntity> stats;

  const PokemonStats({super.key, required this.stats, required this.color});

  @override
  Widget build(_) {
    return Column(
      spacing: 8.0,
      children:
          stats.map((stat) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    statName(stat.name),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(child: Text(stat.value.toString())),
                Expanded(
                  flex: 3,
                  child: StatProgressBar(
                    value: stat.value,
                    color: Color.fromRGBO(color[0], color[1], color[2], 1),
                  ),
                ),
              ],
            );
          }).toList(),
    );
  }
}

/// A widget that displays a progress bar for a Pokémon stat.
///
/// The [StatProgressBar] widget visualizes a stat value as a horizontal
/// progress bar. The progress bar's fill is determined by the [_value]
/// parameter, which is clamped between 0 and 100. The [color] parameter
/// specifies the color of the filled portion of the progress bar. The
/// widget is styled with rounded corners and a light background.
class StatProgressBar extends StatelessWidget {
  final int _value;
  final Color color;

  StatProgressBar({super.key, required int value, required this.color})
    : _value = value.clamp(0, 100);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: double.infinity,
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double fillWidth = constraints.maxWidth * (_value / 100);
          return Stack(
            children: [
              Container(),
              Container(
                height: double.infinity,
                width: fillWidth,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
