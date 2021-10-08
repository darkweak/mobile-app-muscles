import 'package:flutter/material.dart';

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
      imagePath: Icons.star_border,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      name: 'Meridians category',
      imagePath: Icons.stacked_bar_chart,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Muscles category',
      imagePath: Icons.stacked_bar_chart,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      name: 'Elements category',
      imagePath: Icons.stacked_bar_chart,
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}
