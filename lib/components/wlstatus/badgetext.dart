import 'package:flutter/material.dart';

import 'package:badges/badges.dart' as badges;

class BadgeText extends StatelessWidget {
  final String innerText;
  final int badgeColor;
  const BadgeText({
    super.key,
    required this.innerText,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        badges.Badge(
          badgeAnimation: const badges.BadgeAnimation.fade(toAnimate: false),
          badgeContent: const SizedBox(
            width: 3,
            height: 3,
          ),
          badgeStyle:
              badges.BadgeStyle(elevation: 0, badgeColor: Color(badgeColor)),
        ),
        Text(
          innerText,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
