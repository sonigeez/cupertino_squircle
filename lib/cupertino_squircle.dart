library cupertino_squircle;

export 'package:cupertino_squircle/cupertino_squircle.dart';

import 'package:cupertino_squircle/squircle_painter.dart';
import 'package:flutter/material.dart';

class CupertinoSquircle extends StatelessWidget {
  const CupertinoSquircle({
    super.key,
    required this.bgColor,
    this.borderColor,
    this.borderWidth,
    required this.height,
  }) : assert(borderWidth == null || borderWidth <= height / 2,
            'Border width cannot be more than half of the height.');

  final Color bgColor;
  final Color? borderColor;
  final double? borderWidth;
  final double height;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(height, height),
      painter: SquircleBorderPainter(
        bgColor: bgColor,
        borderColor: borderColor,
        borderWidth: borderWidth,
      ),
    );
  }
}
