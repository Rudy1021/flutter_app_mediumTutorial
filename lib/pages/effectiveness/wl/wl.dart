import 'package:flutter/material.dart';

import '../../../components/wlstatus/circularindicator.dart';

class WlPage extends StatefulWidget {
  const WlPage({Key? key}) : super(key: key);

  @override
  State<WlPage> createState() => _WlPageState();
}

class _WlPageState extends State<WlPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 38,
                  margin: const EdgeInsets.only(right: 20, left: 15),
                  child: Center(
                      child: Text(
                    "線別",
                  )),
                ),
                Text("稼動率"),
                Text("直通良率"),
                Text("生產效率"),
                Text("綜合效能"),
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
                      height: 70,
                      margin: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            margin: const EdgeInsets.only(right: 20, left: 15),
                            child: Center(
                                child: Text(
                              "L${index + 1}",
                              style: const TextStyle(fontSize: 20),
                            )),
                          ),
                          const CircularIndicator(
                            percent: .7,
                            indicatorColor: 0xff5592d9,
                            isNeedMarginRight: true,
                          ),
                          const CircularIndicator(
                            percent: .28,
                            indicatorColor: 0xff55dbb2,
                            isNeedMarginRight: true,
                          ),
                          const CircularIndicator(
                            percent: 1.0,
                            indicatorColor: 0xfffbbd61,
                            isNeedMarginRight: true,
                          ),
                          Expanded(
                              child: Container(
                            height: 70,
                            decoration: const BoxDecoration(
                              color: Color(0xffe47f7f),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(6),
                                  bottomRight: Radius.circular(6)),
                            ),
                            child: const Center(
                                child: Text("28%",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white))),
                          )),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
