import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabIconData {
  TabIconData({
    this.name = '',
    this.imagePath = Icons.star,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  String name;
  IconData imagePath;
  bool isSelected;
  int index;

  AnimationController? animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      name: 'Home category',
      imagePath: FontAwesomeIcons.book,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      name: 'Meridians category',
      imagePath: FontAwesomeIcons.userCircle,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Muscles category',
      imagePath: FontAwesomeIcons.commentDots,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Elements category',
      imagePath: FontAwesomeIcons.cog,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
