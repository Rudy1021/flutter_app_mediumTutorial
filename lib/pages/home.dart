import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import 'components/charts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  List<String> line = ["L01", "L02", "L03", "L04"];
  String selectedValue = "L01";
  num test = 3.9;
  TabController? _tabBarController;
  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: const Text("各線狀況"),
                  ),
                  DropdownButton2(
                    isDense: true,
                    items: line
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
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    iconStyleData: const IconStyleData(iconSize: 30),
                    menuItemStyleData: MenuItemStyleData(
                        overlayColor: MaterialStateProperty.all(Colors.black)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            TabBar(
              controller: _tabBarController,
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.black,
              tabs: const [
                Tab(
                  text: '當天工單',
                ),
                Tab(
                  text: '統計圖表',
                )
              ],
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: const Border(
                        top: BorderSide(color: Colors.grey, width: 0.5))),
                child: TabBarView(
                  controller: _tabBarController,
                  children: [
                    Center(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text("aaa"),
                      ),
                    ),
                    const Charts(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
