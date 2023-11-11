import 'dart:math';
import 'package:flutter/material.dart';

/// A [CustomPainter] that draws a squircle shape with an optional border.
///
/// The squircle is a mathematical shape intermediate between a square and a circle.
/// This painter allows customization of the background color and an optional
/// border with configurable color and width.
///
/// Example usage:
/// ```dart
/// CustomPaint(
///   painter: SquircleBorderPainter(
///     bgColor: Colors.blue,
///     borderColor: Colors.white,
///     borderWidth: 3.0,
///   ),
/// )
/// ```
class SquircleBorderPainter extends CustomPainter {
  /// The background color of the squircle.
  final Color bgColor;

  /// The color of the border. If null, no border is drawn.
  final Color? borderColor;

  /// The width of the border. If null, no border is drawn.
  final double? borderWidth;

  /// Creates a [SquircleBorderPainter] with the given background color,
  /// and optional border color and width.
  SquircleBorderPainter({
    required this.bgColor,
    this.borderColor,
    this.borderWidth,
  });

  /// Calculates a point on the superellipse curve that defines the squircle shape.
  ///
  /// [angle]: The angle (in radians) where the point is located on the curve.
  /// [width]: The width of the squircle.
  /// [height]: The height of the squircle.
  /// Returns an [Offset] representing the calculated point.
  Offset superellipsePoint(double angle, double width, double height) {
    const n = 3.8;
    final cosA = cos(angle);
    final sinA = sin(angle);

    final x = pow((cosA).abs(), 2.0 / n) * width * cosA.sign / 2;
    final y = pow((sinA).abs(), 2.0 / n) * height * sinA.sign / 2;

    return Offset(x, y);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Paint border = Paint()
      ..color = borderColor ?? Colors.transparent
      ..strokeWidth = borderWidth ?? 0
      ..style = PaintingStyle.stroke;

    final Paint fill = Paint()
      ..color = bgColor
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2);
    const step = pi / 360;
    final Path path = Path();

    final start = superellipsePoint(pi / 2, size.width, size.height);
    path.moveTo(center.dx + start.dx, center.dy + start.dy);

    for (double angle = pi / 2; angle < (pi / 2) + (2 * pi); angle += step) {
      final point = superellipsePoint(angle, size.width, size.height);
      path.lineTo(center.dx + point.dx, center.dy + point.dy);
    }

    path.close();
    canvas.drawPath(path, fill);
    canvas.drawPath(path, border);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
