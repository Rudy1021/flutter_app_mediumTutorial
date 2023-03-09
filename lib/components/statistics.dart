import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      // shrinkWrap: true,
      padding: const EdgeInsets.all(20),
      children: [
        const Statisticard(
          widgetColor: Colors.blue,
          firstText: "稼動時間",
          secText: "應稼動時間",
          firstNum: "240",
          secNum: "255",
          iconName: Icons.add_chart,
        ),
        const Statisticard(
          widgetColor: Colors.greenAccent,
          firstText: "生產工時",
          secText: "入庫工時",
          firstNum: "138.1h",
          secNum: "111.8h",
          iconName: Icons.ssid_chart,
        ),
        Statisticard(
          widgetColor: Colors.yellowAccent[700]!,
          firstText: "產出總數",
          secText: "不良總數",
          firstNum: "516",
          secNum: "0",
          iconName: Icons.electric_bolt,
        ),
        const Statisticard(
          widgetColor: Colors.redAccent,
          firstText: "異常累計",
          secText: "停產次數/停產工時",
          firstNum: "0",
          secNum: "0/0.0h",
          iconName: Icons.e_mobiledata,
        ),
      ],
    );
  }
}

class Statisticard extends StatelessWidget {
  const Statisticard(
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
