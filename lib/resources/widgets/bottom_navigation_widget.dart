import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/bottom_navigation.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

class BottomNavigationWidget extends NyStatefulWidget {
  BottomNavigationWidget({Key? key, required this.items, this.changeIndex})
      : super(key: key);

  final Function(int index)? changeIndex;
  List<TabIconData> items;

  @override
  _BottomNavigationWidgetState createState() =>
      _BottomNavigationWidgetState(items: items);
}

class _BottomNavigationWidgetState extends NyState<BottomNavigationWidget>
    with TickerProviderStateMixin {
  var _bottomNavIndex = 0; //default index of a first screen

  late Animation<double> animation;
  late CurvedAnimation curve;

  List<String> _routes = ['/atlas', '/muscles', '/emotions', '/parameters'];

  _BottomNavigationWidgetState({required this.items});

  late AnimationController animationController;
  List<TabIconData> items;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    curve = CurvedAnimation(
      parent: animationController,
      curve: Interval(
        0.5,
        1.0,
        curve: Curves.fastOutSlowIn,
      ),
    );
    animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curve);
    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBottomNavigationBar.builder(
      itemCount: this.items.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Colors.white : Colors.white.withOpacity(0.1);
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.items[index].imagePath,
              size: 24,
              color: color,
            ),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
            )
          ],
        );
      },
      backgroundColor: NyColors.of(context).appBarBackground,
      activeIndex: _bottomNavIndex,
      notchAndCornersAnimation: animation,
      splashSpeedInMilliseconds: 300,
      notchSmoothness: NotchSmoothness.defaultEdge,
      gapLocation: GapLocation.center,
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      onTap: (index) {
        if (index != _bottomNavIndex) {
          setState(() => _bottomNavIndex = index);
          routeTo(_routes[index]);
        }
      },
    );
  }
}
