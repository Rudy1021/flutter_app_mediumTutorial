import 'package:flutter/material.dart';
import 'package:flutter_app_testpage/pages/components/statistics.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "生產四率",
                  style: TextStyle(fontSize: 15),
                ),
              ),
              AspectRatio(
                aspectRatio: 1.7,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: const ContinuousRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  elevation: 3,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 10),
                            child: CircularPercentIndicator(
                              progressColor: Colors.greenAccent,
                              radius: 80,
                              // animation: true,
                              lineWidth: 15,
                              percent: 0.369,
                              arcType: ArcType.HALF,
                              arcBackgroundColor: Colors.grey[300],
                              center: Column(
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    "設備綜合效能",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 3),
                                    child: const Text("36.9%"),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 100),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.blue[600],
                                  radius: 40,
                                  lineWidth: 8,
                                  // animation: true,
                                  percent: 0.939,
                                  center: const Text("93.9%"),
                                  footer: const Text("稼動率"),
                                ),
                                CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.lightBlue[200],
                                  radius: 40,
                                  lineWidth: 8,
                                  // animation: true,
                                  percent: 0.939,
                                  center: const Text("93.9%"),
                                  footer: const Text("生產效率"),
                                ),
                                CircularPercentIndicator(
                                  circularStrokeCap: CircularStrokeCap.round,
                                  progressColor: Colors.greenAccent[100],
                                  radius: 40,
                                  lineWidth: 8,
                                  // animation: true,
                                  percent: 93.9 / 100,
                                  center: const Text("93.9%"),
                                  footer: const Text("直通良率"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        DefaultTabController(
          length: 2, // length of tabs
          initialIndex: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    text: '生產統計',
                  ),
                  Tab(text: '全天趨勢'),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2 -
                    AppBar().preferredSize.height,
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  children: [
                    Statistics(),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text('Display Tab 2',
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
