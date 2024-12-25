import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // إعداد التدرج اللوني
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: Get.isDarkMode
            ? [
                Colors.black,
                Colors.black87,
              ]
            : [
                Colors.blue.shade100,
                Colors.white,
              ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    // رسم المسار الأساسي (الحدود الملتوية)
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

    // رسم الظل
    canvas.drawShadow(
      path,
      Get.isDarkMode ? Colors.black : Colors.blue.withOpacity(0.3),
      5,
      true,
    );

    // رسم الشكل الرئيسي
    canvas.drawPath(path, paint);

    // إعداد الرسم الزخرفي (الخط المزين)
    final decorPaint = Paint()
      ..color = Get.isDarkMode 
          ? Colors.grey[800]!.withOpacity(0.3)  // تأثير خفيف للظل في الوضع المظلم
          : Colors.blue.withOpacity(0.2)  // تأثير خفيف للظل في الوضع الفاتح
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

    // رسم الخط الزخرفي
    canvas.drawPath(decorPath, decorPaint);
  }

  @override
  bool shouldRepaint(CustomContainerPainter oldDelegate) => false;  
}
