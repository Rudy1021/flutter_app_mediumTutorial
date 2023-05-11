import 'package:flutter/material.dart';

import '../../../components/wlstatus/circularindicator.dart';
import '../../../components/wlstatus/lineindicator.dart';

class OperationAlldayPage extends StatefulWidget {
  const OperationAlldayPage({Key? key}) : super(key: key);

  @override
  State<OperationAlldayPage> createState() => _OperationAlldayPageState();
}

class _OperationAlldayPageState extends State<OperationAlldayPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5),
            padding: const EdgeInsets.only(bottom: 10),
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
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
                                  LineIndicator(
                                    containerWidth: containerWidth,
                                    percent: 1.0,
                                    indicatorColor: 0xff55dbb2,
                                    leadingText: "日",
                                  ),
                                  LineIndicator(
                                    containerWidth: containerWidth,
                                    percent: .45,
                                    indicatorColor: 0xffe47f7f,
                                    leadingText: "夜",
                                    isBottom: true,
                                  ),
                                ],
                              );
                            }),
                          ),
                          const CircularIndicator(
                            percent: .7,
                            indicatorColor: 0xff6ae9c2,
                            isDangerous: true,
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
