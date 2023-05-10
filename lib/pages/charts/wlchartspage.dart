import 'package:flutter/material.dart';
import 'package:flutter_app_testpage/components/allday.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:extended_sliver/extended_sliver.dart';

import '../../components/productstatistic.dart';

class WlChartsPage extends StatefulWidget {
  const WlChartsPage({Key? key}) : super(key: key);

  @override
  State<WlChartsPage> createState() => _WlChartsPageState();
}

class _WlChartsPageState extends State<WlChartsPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return [
          SliverPinnedToBoxAdapter(
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: Column(
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
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
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
                                              height: 40,
                                            ),
                                            const Text(
                                              "設備綜合效能",
                                              style: TextStyle(
                                                fontSize: 17,
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.only(top: 3),
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
                                        children: [
                                          CircularPercentIndicator(
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor: Colors.blue[600],
                                            radius: 40,
                                            lineWidth: 8,
                                            // animation: true,
                                            percent: 0.939,
                                            center: const Text("93.9%"),
                                            footer: const Text("稼動率"),
                                          ),
                                          CircularPercentIndicator(
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor:
                                                Colors.lightBlue[200],
                                            radius: 40,
                                            lineWidth: 8,
                                            // animation: true,
                                            percent: 0.939,
                                            center: const Text("93.9%"),
                                            footer: const Text("生產效率"),
                                          ),
                                          CircularPercentIndicator(
                                            circularStrokeCap:
                                                CircularStrokeCap.round,
                                            progressColor:
                                                Colors.greenAccent[100],
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
                  TabBar(
                    controller: _tabController,
                    labelColor: Colors.blue,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                        text: '生產統計',
                      ),
                      Tab(text: '全天趨勢'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ];
      },
      body: Container(
        decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.grey, width: 0.5))),
        child: TabBarView(
          controller: _tabController,
          children: const [ProductStatisticPage(), WlAllDayPage()],
        ),
      ),
    );
  }
}
