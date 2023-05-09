import 'package:flutter/material.dart';

class RulerPage extends StatefulWidget {
  const RulerPage({Key? key}) : super(key: key);

  @override
  State<RulerPage> createState() => _RulerPageState();
}

class _RulerPageState extends State<RulerPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Stack(
            children: [
              CustomPaint(
                size: const Size(double.infinity, 50),
                painter: RulerPainter(),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text("LO1"),
              Expanded(
                child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  final containerWidth = constraints.maxWidth;
                  return Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.16),
                          offset: Offset(0, 3),
                          blurRadius: 3,
                        ),
                      ],
                    ),
                    width: containerWidth,
                    height: 30,
                    child: Row(
                      children: [
                        Container(
                          color: Colors.green,
                          width: containerWidth * (5 / 12), // 43200
                        ),
                        Container(
                          color: Colors.red,
                          width: containerWidth * (1 / 12),
                        ),
                        Container(
                          color: Colors.white,
                          width: containerWidth * (3 / 12),
                        ),
                        Container(
                          color: Colors.blue,
                          width: containerWidth * (3 / 12),
                        ),
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final double tickWidth = 1;
  final double tickHeight = 12;
  final double labelFontSize = 12;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.grey;

    // 繪製刻度線
    for (double i = 0; i <= 24; i++) {
      double dx = i * (size.width / 24);
      canvas.drawLine(
        Offset(dx, size.height - tickHeight),
        Offset(dx, size.height),
        paint,
      );
    }
    // canvas.drawLine(
    //   Offset(0, size.height - tickHeight),
    //   Offset(0, size.width),
    //   paint,
    // );
    // 繪製刻度標籤
    for (double i = 0; i <= 24; i += 6) {
      String label = '${i.round()}:00';
      TextPainter tp = TextPainter(
        text: TextSpan(
          text: label,
          style: TextStyle(
            color: Colors.grey,
            fontSize: labelFontSize,
          ),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      double dx = i * (size.width / 24) - tp.width / 2;
      tp.paint(
          canvas, Offset(dx, size.height - tickHeight - labelFontSize - 4));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
