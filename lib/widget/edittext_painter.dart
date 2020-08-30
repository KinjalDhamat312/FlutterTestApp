import 'package:flutter/material.dart';

class EditTextPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..lineTo(0, 0)
      ..lineTo(size.width - 20, 0)
      ..lineTo(size.width, size.height / 2)
      ..lineTo(size.width - 20, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
