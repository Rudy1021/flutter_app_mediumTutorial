import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/price_point.dart';

class WoNDetailPage extends StatefulWidget {
  const WoNDetailPage({
    Key? key,
  }) : super(key: key);

  @override
  State<WoNDetailPage> createState() => _WoNDetailPageState();
}

class _WoNDetailPageState extends State<WoNDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("工單詳細資訊"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "工單資訊",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 1.3,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 3,
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.centerRight,
                              child: const badges.Badge(
                                badgeAnimation: badges.BadgeAnimation.fade(
                                    toAnimate: false),
                                badgeContent: SizedBox(
                                  width: 10,
                                  height: 10,
                                ),
                                badgeStyle: badges.BadgeStyle(
                                    elevation: 0,
                                    badgeColor: Color(0xfffecb00)),
                              ),
                            ),
                            const CardText(
                              labelText: "工      單:SP202301031",
                            ),
                          ],
                        ),
                        const CardText(
                          labelText: "料      號:PAK.2210091.002G",
                        ),
                        const CardText(
                          labelText: "品      名: Dell CY23 Dakar Fix_咬花板 VESA後蓋",
                        ),
                        const CardText(
                          labelText: "機種名稱:全力發-CLF-100T",
                        ),
                        const CardText(
                          labelText: "在線人數:31",
                        ),
                        const CardText(
                          labelText: "實計工時:236.8h",
                        ),
                        const CardText(
                          labelText: "更新時間:2023-01-05 14:32:22",
                        ),
                        const CardText(
                          labelText: "歷       程:報停工",
                          labelColor: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "數量總計",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 2,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.blue[600],
                        radius: 60,
                        lineWidth: 8,
                        percent: 0.939,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("產出數量"),
                            Text(
                              "1065",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 15, bottom: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.square,
                                  size: 12,
                                ),
                                Text(
                                  "計畫產量      ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "1600",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.square,
                                  size: 12,
                                ),
                                Text(
                                  "產出數量      ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                Text(
                                  "1065",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Icon(
                                  Icons.square,
                                  size: 12,
                                ),
                                Text(
                                  "不良數量        ",
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "3",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "不良品統計",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 1.8,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 3,
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: BarChart(
                      BarChartData(
                        barGroups: _chartGroups(),
                        borderData: FlBorderData(
                            border: const Border(
                                bottom: BorderSide(), left: BorderSide())),
                        gridData: FlGridData(show: false),
                        titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: true)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "不良品統計",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 1.8,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 3,
                  child: LineChart(
                    LineChartData(lineBarsData: [
                      LineChartBarData(
                        spots: pricePoints
                            .map((point) => FlSpot(point.x, point.y))
                            .toList(),
                      )
                    ]),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "生產比率",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 5,
              ),
              AspectRatio(
                aspectRatio: 1.3,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      PercentBar(
                        widgetColor: Colors.greenAccent[400]!,
                      ),
                      PercentBar(
                        iconName: Icons.electric_bolt,
                        widgetColor: Colors.yellow[700]!,
                      ),
                      const PercentBar(
                        iconName: Icons.bar_chart,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//---------------------------------------------------------------------------\\
  List<BarChartGroupData> _chartGroups() {
    return pricePoints
        .map((point) => BarChartGroupData(
            x: point.x.toInt(), barRods: [BarChartRodData(toY: point.y)]))
        .toList();
  }

  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = 'Jan';
              break;
            case 2:
              text = 'Mar';
              break;
            case 4:
              text = 'May';
              break;
            case 6:
              text = 'Jul';
              break;
            case 8:
              text = 'Sep';
              break;
            case 10:
              text = 'Nov';
              break;
          }

          return Text(text);
        },
      );
  //---------------------------------------------------------------------------//
}

class PercentBar extends StatelessWidget {
  const PercentBar(
      {super.key,
      this.widgetColor = Colors.blue,
      this.iconName = Icons.add_chart});
  final Color widgetColor;
  final IconData iconName;
  @override
  Widget build(BuildContext context) {
    return Row(
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
            padding: const EdgeInsets.only(right: 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      "達成率",
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      "66.6%",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                LinearPercentIndicator(
                  progressColor: widgetColor,
                  barRadius: const Radius.circular(20),
                  padding: EdgeInsets.zero,
                  lineHeight: 10,
                  percent: 0.66,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CardText extends StatelessWidget {
  const CardText(
      {super.key, required this.labelText, this.labelColor = Colors.black});
  final Color labelColor;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        labelText,
        style: TextStyle(
          fontSize: 17,
          color: labelColor,
        ),
      ),
    );
  }
}
