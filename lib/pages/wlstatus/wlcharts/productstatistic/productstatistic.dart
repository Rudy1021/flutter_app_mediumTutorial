import 'package:flutter/material.dart';

import '../../../../components/wlstatus/statisticcard.dart';

class ProductStatisticPage extends StatefulWidget {
  const ProductStatisticPage({Key? key}) : super(key: key);

  @override
  State<ProductStatisticPage> createState() => _ProductStatisticPageState();
}

class _ProductStatisticPageState extends State<ProductStatisticPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.all(20),
      children: [
        const StatisticCard(
          widgetColor: Colors.blue,
          firstText: "稼動時間",
          secText: "應稼動時間",
          firstNum: "240",
          secNum: "255",
          iconName: Icons.add_chart,
        ),
        const StatisticCard(
          widgetColor: Colors.greenAccent,
          firstText: "生產工時",
          secText: "入庫工時",
          firstNum: "138.1h",
          secNum: "111.8h",
          iconName: Icons.ssid_chart,
        ),
        StatisticCard(
          widgetColor: Colors.yellowAccent[700]!,
          firstText: "產出總數",
          secText: "不良總數",
          firstNum: "516",
          secNum: "0",
          iconName: Icons.electric_bolt,
        ),
        const StatisticCard(
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
