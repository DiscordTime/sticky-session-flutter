
import 'package:flutter/material.dart';

class StickyCard extends StatelessWidget {
  final Color color;
  final Widget? child;

  const StickyCard({Key? key, required this.color, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: StickyCardPainter(
        color: color,
        isShadow: true
      ),
      child: child,
    );
  }
}

class StickyCardPainter extends CustomPainter {
  final Color color;
  final bool isShadow;

  StickyCardPainter({
    required this.color,
    this.isShadow = false
  });

  @override
  void paint(Canvas canvas, Size size) {
    draw(canvas, Path()
      ..moveTo(0, size.height)
      ..lineTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height - 30)
      ..lineTo(size.width - 30, size.height),
      Paint()
        ..color = color
        ..strokeWidth = 3
        ..style = PaintingStyle.fill
    );

    draw(
      canvas,
      Path()
        ..moveTo(size.width, size.height - 30)
        ..lineTo(size.width - 30, size.height - 30)
        ..lineTo(size.width - 30, size.height),
      Paint()
        ..color = Colors.grey
        ..strokeWidth = 3
        ..style = PaintingStyle.fill
    );
  }

  void draw(Canvas canvas, Path path, Paint paint) {
    if (isShadow) {
      canvas.drawShadow(
          path,
          Colors.grey.shade300,
          5,
          false
      );
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant StickyCardPainter oldDelegate) {
    return oldDelegate.color != color;
  }
}

