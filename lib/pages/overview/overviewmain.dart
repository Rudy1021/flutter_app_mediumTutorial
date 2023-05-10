import 'package:flutter/material.dart';
import 'package:flutter_app_testpage/pages/overview/allday/allday.dart';
import 'package:flutter_app_testpage/pages/overview/ruler/ruler.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class Overviewmain extends StatefulWidget {
  const Overviewmain({Key? key}) : super(key: key);

  @override
  State<Overviewmain> createState() => _OverviewmainState();
}

class _OverviewmainState extends State<Overviewmain> {
  List<String> tabTitle = ["稼動尺", "全天趨勢"];
  List<String> category = ["全部", "L02", "L03", "L04"];
  String selectedCategory = "全部";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitle.length,
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Container(
              padding: const EdgeInsets.all(5),
              child: const Text("稼動總覽"),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                width: double.infinity,
                color: Colors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        selectedItemBuilder: (_) {
                          return category
                              .map((e) => Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ))
                              .toList();
                        },
                        isDense: true,
                        items: category
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value as String;
                          });
                        },
                        iconStyleData: const IconStyleData(iconSize: 30),
                        menuItemStyleData: MenuItemStyleData(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    ),
                    DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        selectedItemBuilder: (_) {
                          return category
                              .map((e) => Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      e,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                  ))
                              .toList();
                        },
                        isDense: true,
                        items: category
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: selectedCategory,
                        onChanged: (value) {
                          setState(() {
                            selectedCategory = value as String;
                          });
                        },
                        iconStyleData: const IconStyleData(iconSize: 30),
                        menuItemStyleData: MenuItemStyleData(
                            overlayColor:
                                MaterialStateProperty.all(Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
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
