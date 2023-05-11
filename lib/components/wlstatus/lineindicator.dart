import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class LineIndicator extends StatelessWidget {
  const LineIndicator({
    super.key,
    required this.containerWidth,
    required this.percent,
    required this.indicatorColor,
    this.leadingText = "",
    this.isBottom = false,
  });

  final double containerWidth;
  final double percent;
  final int indicatorColor;
  final String leadingText;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isBottom ? null : const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LinearPercentIndicator(
            barRadius: const Radius.circular(6),
            width: containerWidth - 70,
            lineHeight: 10.0,
            percent: percent,
            backgroundColor: const Color(0xfff5f4f4),
            progressColor: Color(indicatorColor),
            trailing: Text("${percent * 100}%"),
            leading: Text(leadingText),
          ),
        ],
      ),
    );
  }
}
