import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0XFF522700)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Paint inactivePaint = Paint()
      ..color = Colors.white.withOpacity(0.5)
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Rect rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 60);
    canvas.drawArc(rect, 3.1, 2.1, false, paint); // القوس الملون
    canvas.drawArc(rect, 5.2, 1, false, inactivePaint); // الجزء الباهت
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}