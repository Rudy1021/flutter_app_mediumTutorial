import 'package:flutter/material.dart';

class Overviewmain extends StatefulWidget {
  const Overviewmain({Key? key}) : super(key: key);

  @override
  State<Overviewmain> createState() => _OverviewmainState();
}

class _OverviewmainState extends State<Overviewmain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: Container(),
    );
  }
}
