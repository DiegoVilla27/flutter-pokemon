import 'package:flutter/material.dart';
import 'package:flutter_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

/// A widget that provides a search interface for filtering a list of Pokémon.
/// 
/// This widget allows users to filter Pokémon based on specific criteria and
/// change the generation of Pokémon being displayed.
/// 
/// The [pokemonsAll] parameter is a list of all available Pokémon entities.
/// The [onPokemonsFiltered] callback is triggered with the filtered list of Pokémon.
/// The [changeGeneration] callback is used to change the current Pokémon generation.
class PokemonSearch extends StatefulWidget {
  final List<PokemonEntity> pokemonsAll;
  final void Function(List<PokemonEntity>) onPokemonsFiltered;
  final void Function(int) changeGeneration;

  const PokemonSearch({
    super.key,
    required this.changeGeneration,
    required this.pokemonsAll,
    required this.onPokemonsFiltered,
  });

  @override
  State<PokemonSearch> createState() => _PokemonSearchState();
}

class _PokemonSearchState extends State<PokemonSearch> {
  final TextEditingController _controller = TextEditingController();
  int _generation = 1;
  bool _showCloseIcon = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_typing);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// Toggles the current generation between 1 and 2, and updates the widget
  /// with the new generation value.
  void _onChangeGeneration() {
    _generation = _generation == 1 ? 2 : 1;
    widget.changeGeneration(_generation);
  }

  /// Handles typing events by retrieving the current text from the controller,
  /// toggling the close button visibility based on the text, and applying a filter.
  void _typing() {
    final text = _controller.text;
    _toggleCloseBtn(text);
    _filter(text);
  }

  /// Filters the list of Pokémon based on the provided text.
  ///
  /// Converts the input text to lowercase and trims it before filtering.
  /// The filtering is case-insensitive and checks if the Pokémon's name
  /// contains the query string. The filtered list is then passed to the
  /// `onPokemonsFiltered` callback.
  ///
  /// [param] text The input text used for filtering the Pokémon list.
  void _filter(String text) {
    final query = text.toLowerCase().trim();
    final filtered =
        widget.pokemonsAll.where((pokemon) {
          return pokemon.name.toLowerCase().contains(query);
        }).toList();
    widget.onPokemonsFiltered(filtered);
  }

  /// Toggles the visibility of the close button based on the provided text.
  ///
  /// Sets the `_showCloseIcon` to `true` if the `text` is not empty,
  /// otherwise sets it to `false`.
  ///
  /// This method triggers a state update.
  void _toggleCloseBtn(String text) {
    setState(() => _showCloseIcon = text.isNotEmpty);
  }

  /// Clears the text field by resetting the controller and toggles the close button.
  ///
  /// This method clears the text in the associated text field by calling the
  /// `clear` method on the `_controller`. It also updates the state of the
  /// close button by calling `_toggleCloseBtn` with an empty string.
  void _clearTextField() {
    _controller.clear();
    _toggleCloseBtn('');
  }

  @override
  Widget build(_) {
    return Column(
      spacing: 5.0,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Pokedex",
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ButtonStyle(elevation: WidgetStateProperty.all(4)),
              onPressed: _onChangeGeneration,
              child: Text(
                "Gen. ${(_generation == 1) ? '2' : '1'}",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            label: const Text(
              "Search Pokemon...",
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            prefixIcon: const Padding(
              padding: EdgeInsets.only(left: 2.0),
              child: Icon(Icons.search),
            ),
            suffixIcon:
                _showCloseIcon
                    ? IconButton(
                      onPressed: _clearTextField,
                      icon: const Icon(Icons.close, size: 15),
                    )
                    : null,
          ),
        ),
      ],
    );
  }
}
