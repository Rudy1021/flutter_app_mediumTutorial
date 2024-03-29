import 'package:flutter/material.dart';

import '../../../components/wlstatus/badgetext.dart';
import '../../../components/wlstatus/lineindicator.dart';

class EffectsPage extends StatefulWidget {
  const EffectsPage({Key? key}) : super(key: key);

  @override
  State<EffectsPage> createState() => _EffectsPageState();
}

class _EffectsPageState extends State<EffectsPage> {
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                },
              ),
              const Text("全部顯示"),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red, //选中时的颜色
                onChanged: (value) {
                  setState(() {
                    _checkboxSelected = value!;
                  });
                },
              ),
              const Text("部分顯示"),
            ],
          ),
          Row(
            children: const [
              BadgeText(
                innerText: "稼動率",
                badgeColor: 0xff58a0f5,
              ),
              BadgeText(
                innerText: "直通良率",
                badgeColor: 0xffffc847,
              ),
              BadgeText(
                innerText: "生產效率",
                badgeColor: 0xff82dc85,
              ),
              BadgeText(
                innerText: "綜合效能",
                badgeColor: 0xfff16767,
              ),
            ],
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
                                    percent: .82,
                                    indicatorColor: 0xff58a0f5,
                                  ),
                                  LineIndicator(
                                    containerWidth: containerWidth,
                                    percent: .45,
                                    indicatorColor: 0xffffc847,
                                  ),
                                  LineIndicator(
                                    containerWidth: containerWidth,
                                    percent: .45,
                                    indicatorColor: 0xff82dc85,
                                  ),
                                  LineIndicator(
                                    containerWidth: containerWidth,
                                    percent: .45,
                                    indicatorColor: 0xffe47f7f,
                                    isBottom: true,
                                  ),
                                ],
                              );
                            }),
                          ),
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
