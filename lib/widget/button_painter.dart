import 'package:flutter/material.dart';

class ButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth =2
      ..style = PaintingStyle.stroke;

    var path = Path()
      ..moveTo(15, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width - 15, size.height)
      ..lineTo(0, size.height)..lineTo(15, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
