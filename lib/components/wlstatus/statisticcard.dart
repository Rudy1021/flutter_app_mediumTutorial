import 'package:flutter/material.dart';

class StatisticCard extends StatelessWidget {
  const StatisticCard(
      {super.key,
      this.widgetColor = Colors.blue,
      this.iconName = Icons.bar_chart,
      this.firstText = "",
      this.secText = "",
      this.firstNum = "",
      this.secNum = ""});

  final Color widgetColor;
  final String firstText;
  final IconData iconName;
  final String secText;
  final String firstNum;
  final String secNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Card(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 5,
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: widgetColor, blurRadius: 3.0)],
                  color: widgetColor,
                  borderRadius: const BorderRadius.all(Radius.circular(8))),
              child: Icon(
                iconName,
                size: 30,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 15),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          firstText,
                          style: const TextStyle(fontSize: 20),
                        ),
                        Text(
                          "/$secText",
                          style: const TextStyle(fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          firstNum,
                          style: TextStyle(fontSize: 20, color: widgetColor),
                        ),
                        Text(
                          " /$secNum",
                          style: TextStyle(color: widgetColor),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
