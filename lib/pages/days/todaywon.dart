import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;
import 'package:flutter_app_testpage/pages/days/wondetail.dart';

class TodayWoNPage extends StatefulWidget {
  const TodayWoNPage({Key? key}) : super(key: key);

  @override
  State<TodayWoNPage> createState() => _TodayWoNPageState();
}

class _TodayWoNPageState extends State<TodayWoNPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "工單資訊",
            style: TextStyle(fontSize: 22),
          ),
          SizedBox(
            height: 70,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WoNDetailPage()));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                elevation: 3,
                child: Container(
                  margin: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      badges.Badge(
                        badgeAnimation:
                            badges.BadgeAnimation.fade(toAnimate: false),
                        badgeContent: SizedBox(
                          width: 10,
                          height: 10,
                        ),
                        badgeStyle: badges.BadgeStyle(
                            elevation: 0, badgeColor: Color(0xfffecb00)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Text(
                          "工單：SP202301031",
                          style: TextStyle(fontSize: 22),
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
