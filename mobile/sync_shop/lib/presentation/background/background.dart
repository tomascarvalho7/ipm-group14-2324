import 'package:flutter/cupertino.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF2E2E2E),
      child: CustomPaint(
        painter: VectorPainter(),
        child: child,
      )
    );
  }
}

class VectorPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double width = size.width;
    double height = size.height;

    drawVectorA(canvas, width, height);
    drawVectorB(canvas, width, height);
  }

  void drawVectorA(Canvas canvas, double width, double height) {
    var path = Path();

    double step = 50;
    double waveHeight = height * 1.8 / 3;

    path.moveTo(- width / 4, height);
    path.lineTo(- width / 4, waveHeight);
    path.cubicTo(
        width / 2, waveHeight - step * 2,
        width / 2, waveHeight + step * 3.5,
        width, waveHeight + step * 2
    );
    path.lineTo(width, height);
    path.close();

    Paint paint = Paint()
      ..color = const Color.fromRGBO(68, 54, 47, 1.0) // Change color as needed
      ..style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, Color.fromRGBO(243, 182, 156, 1.0), 2, true);
  }

  void drawVectorB(Canvas canvas, double width, double height) {
    var path = Path();

    double step = 50;
    double waveHeight = height * 1.6 / 3;

    path.moveTo(width, height);
    path.lineTo(width, waveHeight);
    path.cubicTo(
        width * 2.5 / 4, waveHeight - step * 1.5,
        width / 2, waveHeight + step * 4,
        0, waveHeight + step * 2
    );
    path.lineTo(0, height);
    path.close();

    Paint paint = Paint()
      ..color = const Color(0xFF17412C)
      ..style = PaintingStyle.fill; // Change color as needed

    canvas.drawPath(path, paint);
    canvas.drawShadow(path, const Color(0xFF52D398), 4, true);
  }


  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}