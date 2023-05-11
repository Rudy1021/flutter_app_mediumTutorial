import 'package:flutter/material.dart';
import 'package:flutter_app_testpage/components/wlstatus/circularindicator.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'allday/allday.dart';
import 'productstatistic/productstatistic.dart';

class WlChartsPage extends StatefulWidget {
  const WlChartsPage({Key? key}) : super(key: key);

  @override
  State<WlChartsPage> createState() => _WlChartsPageState();
}

class _WlChartsPageState extends State<WlChartsPage> {
  final List<Tab> _tabs = [
    const Tab(
      text: '生產統計',
    ),
    const Tab(text: '全天趨勢'),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfff8f8f8),
      child: DefaultTabController(
          length: _tabs.length,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 10, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Text(
                          "生產四率",
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Card(
                      margin: EdgeInsets.zero,
                      shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      elevation: 3,
                      child: Container(
                        padding: const EdgeInsets.only(bottom: 10),
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
                                          height: 40,
                                        ),
                                        const Text(
                                          "設備綜合效能",
                                          style: TextStyle(
                                            fontSize: 17,
                                          ),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: const [
                                      CircularIndicator(
                                        lineWidth: 8,
                                        radius: 40,
                                        percent: .939,
                                        indicatorColor: 0xff1e88e5,
                                        footerText: "稼動率",
                                      ),
                                      CircularIndicator(
                                        lineWidth: 8,
                                        radius: 40,
                                        percent: .939,
                                        indicatorColor: 0xff81d4fa,
                                        footerText: "生產效率",
                                      ),
                                      CircularIndicator(
                                        lineWidth: 8,
                                        radius: 40,
                                        percent: .939,
                                        indicatorColor: 0xffb9f6ca,
                                        footerText: "直通良率",
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
              TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: _tabs,
              ),
              Expanded(
                  child: Container(
                decoration: const BoxDecoration(
                    border: Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: const TabBarView(
                  children: [ProductStatisticPage(), WlAllDayPage()],
                ),
              )),
            ],
          )),
    );
  }
}
