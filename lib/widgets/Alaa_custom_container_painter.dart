import 'package:flutter/material.dart';

class CustomContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.blue.shade100,
          Colors.white,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height * 0.2)
      ..quadraticBezierTo(
        size.width * 0.1,
        0,
        size.width * 0.3,
        0,
      )
      ..lineTo(size.width * 0.7, 0)
      ..quadraticBezierTo(
        size.width * 0.9,
        0,
        size.width,
        size.height * 0.2,
      )
      ..lineTo(size.width, size.height * 0.8)
      ..quadraticBezierTo(
        size.width * 0.9,
        size.height,
        size.width * 0.7,
        size.height,
      )
      ..lineTo(size.width * 0.3, size.height)
      ..quadraticBezierTo(
        size.width * 0.1,
        size.height,
        0,
        size.height * 0.8,
      )
      ..close();

    // Draw shadow
    canvas.drawShadow(path, Colors.blue.withOpacity(0.3), 5, true);
    // Draw main shape
    canvas.drawPath(path, paint);

    // Add decorative line
    final decorPaint = Paint()
      ..color = Colors.blue.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    final decorPath = Path()
      ..moveTo(size.width * 0.2, size.height * 0.1)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.2,
        size.width * 0.8,
        size.height * 0.1,
      );

    canvas.drawPath(decorPath, decorPaint);
  }

  @override
  bool shouldRepaint(CustomContainerPainter oldDelegate) => false;
} 