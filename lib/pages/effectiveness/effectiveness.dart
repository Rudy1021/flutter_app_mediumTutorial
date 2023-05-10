import 'package:flutter/material.dart';

class EffectivenessPage extends StatefulWidget {
  const EffectivenessPage({Key? key}) : super(key: key);

  @override
  State<EffectivenessPage> createState() => _EffectivenessPageState();
}

class _EffectivenessPageState extends State<EffectivenessPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('綜合效能'),
          ),
          body: Container(),
        ));
  }
}
