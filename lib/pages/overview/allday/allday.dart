import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class OverviewAlldayPage extends StatefulWidget {
  const OverviewAlldayPage({Key? key}) : super(key: key);

  @override
  State<OverviewAlldayPage> createState() => _OverviewAlldayPageState();
}

class _OverviewAlldayPageState extends State<OverviewAlldayPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("線別"),
                Text("日夜稼動率"),
                Text("全天稼動率"),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 20,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6)),
                    child: Container(
                      height: 80,
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10),
                            child: Text("L${index + 1}"),
                          ),
                          Expanded(
                            child: LayoutBuilder(builder: (BuildContext context,
                                BoxConstraints constraints) {
                              final containerWidth = constraints.maxWidth;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LinearPercentIndicator(
                                        barRadius: const Radius.circular(6),
                                        width: containerWidth - 55,
                                        lineHeight: 10.0,
                                        percent: 1,
                                        backgroundColor:
                                            const Color(0xfff5f4f4),
                                        progressColor: const Color(0xff55dbb2),
                                        trailing: const SizedBox(
                                          width: 40,
                                          child: Text("100%"),
                                        ),
                                        leading: const Text("日"),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      LinearPercentIndicator(
                                        barRadius: const Radius.circular(6),
                                        width: containerWidth - 55,
                                        lineHeight: 10.0,
                                        percent: 0.45,
                                        backgroundColor:
                                            const Color(0xfff5f4f4),
                                        progressColor: const Color(0xffe47f7f),
                                        trailing: const Text("45%"),
                                        leading: const Text("夜"),
                                      ),
                                    ],
                                  )
                                ],
                              );
                            }),
                          ),
                          CircularPercentIndicator(
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: Colors.blue[600],
                            radius: 30,
                            lineWidth: 4,
                            // animation: true,
                            percent: 0.70,
                            center: const Text("70%"),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
