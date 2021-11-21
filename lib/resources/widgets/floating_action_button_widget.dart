import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../main.dart';

class FloatingActionButtonWidget extends NyStatefulWidget {
  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonState();
}

class _FloatingActionButtonState extends NyState<FloatingActionButtonWidget>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late Animation<double> animation;
  late CurvedAnimation curve;

  @override
  widgetDidLoad() async {
    setState(() {
      animationController = AnimationController(
          duration: const Duration(milliseconds: 2000), vsync: this);
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  }

  @override
  void initState() {
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
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

    Future.delayed(
      Duration(seconds: 1),
      () => animationController.forward(),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: animation,
      child: FloatingActionButton(
        child: Container(
          width: 60,
          height: 60,
          child: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: <Color>[
                NyColors.of(context).gradientAddButtonStart,
                NyColors.of(context).gradientAddButtonStop,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        onPressed: () {
          animationController.reset();
          animationController.forward();
        },
      ),
    );
  }
}
