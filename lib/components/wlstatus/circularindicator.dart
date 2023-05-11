import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CircularIndicator extends StatelessWidget {
  const CircularIndicator({
    required this.percent,
    required this.indicatorColor,
    this.isDangerous = false,
    this.isNeedMarginRight = false,
    this.radius = 30.0,
    this.footerText = "",
    this.lineWidth = 4.0,
    super.key,
  });

  final double percent;
  final int indicatorColor;
  final bool isDangerous;
  final bool isNeedMarginRight;
  final double radius;
  final String footerText;
  final double lineWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isNeedMarginRight ? const EdgeInsets.only(right: 10) : null,
      child: CircularPercentIndicator(
        circularStrokeCap: CircularStrokeCap.round,
        progressColor: isDangerous
            ? percent < 0.6
                ? const Color(0xffe47f7f)
                : Color(indicatorColor)
            : Color(indicatorColor),
        radius: radius,
        lineWidth: lineWidth,
        // animation: true,
        percent: percent,
        center: Text(
          percent == percent.toInt()
              ? "${(percent * 100).toInt()}%"
              : "${(percent * 100).toStringAsFixed(1)}%",
        ),
        footer: footerText == "" ? null : Text(footerText),
      ),
    );
  }
}
