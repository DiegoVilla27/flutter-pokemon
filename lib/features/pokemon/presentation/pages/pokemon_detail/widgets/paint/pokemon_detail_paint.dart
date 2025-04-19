import 'package:flutter/material.dart';

/// A widget that paints a custom background using a specified color.
///
/// The `PokemonPaint` widget takes a list of integers representing RGB
/// values to create a `Color` object. This color is then used by a
/// `_CurvePaint` painter to render a custom painted background that
/// fills the entire available space.
///
/// The `pokemonColor` parameter is required and should contain exactly
/// three integers representing the red, green, and blue components of
/// the color.
class PokemonPaint extends StatelessWidget {
  final List<int> pokemonColor;

  const PokemonPaint({super.key, required this.pokemonColor});

  @override
  Widget build(_) {
    Color color = Color.fromRGBO(
      pokemonColor[0],
      pokemonColor[1],
      pokemonColor[2],
      1,
    );

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CustomPaint(painter: _CurvePaint(color: color)),
    );
  }
}

/// A custom painter that draws a curved path with a gradient fill.
///
/// The `_CurvePaint` class extends `CustomPainter` to create a custom
/// painted background. It uses a linear gradient that transitions from
/// the specified `color` to black. The gradient is applied to a path
/// that starts from the top left, curves through the center, and ends
/// at the top right of the canvas. The `paint` method defines the
/// drawing logic, while `shouldRepaint` always returns true to ensure
/// the canvas is repainted whenever necessary.
class _CurvePaint extends CustomPainter {
  final Color color;

  const _CurvePaint({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromCircle(center: Offset(150.0, 55.0), radius: 180);
    final Gradient gradient = LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [color, Colors.black],
      stops: [0.01, 1.0],
    );
    final pencil = Paint()..shader = gradient.createShader(rect);

    pencil.color = Color(0xff615aab);
    pencil.style = PaintingStyle.fill;
    pencil.strokeWidth = 20;

    final path = Path();

    path.lineTo(0, size.height * 0.25);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height * 0.4,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);

    canvas.drawPath(path, pencil);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
