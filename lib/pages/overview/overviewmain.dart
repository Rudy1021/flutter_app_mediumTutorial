import 'package:flutter/material.dart';
import 'package:flutter_app_testpage/pages/overview/allday/allday.dart';
import 'package:flutter_app_testpage/pages/overview/ruler/ruler.dart';

class Overviewmain extends StatefulWidget {
  const Overviewmain({Key? key}) : super(key: key);

  @override
  State<Overviewmain> createState() => _OverviewmainState();
}

class _OverviewmainState extends State<Overviewmain> {
  List<String> tabTitle = ["稼動尺", "全天趨勢"];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitle.length,
      child: Scaffold(
          appBar: AppBar(
            title: const Text('稼動總覽'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              const TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      '稼動尺',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Tab(
                    child: Text(
                      '全天趨勢',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      border: const Border(
                          top: BorderSide(color: Colors.grey, width: 0.5))),
                  child: const TabBarView(
                    children: [
                      RulerPage(),
                      OverviewAlldayPage(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
