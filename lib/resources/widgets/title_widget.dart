import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/text_theme/default_text_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

class TitleWidget extends NyStatefulWidget {
  final String title;
  final AnimationController? animationController;

  TitleWidget({Key? key, this.title: "", this.animationController}) : super();

  @override
  _TitleWidgetState createState() =>
      _TitleWidgetState(animationController: animationController, title: title);
}

class _TitleWidgetState extends NyState<TitleWidget>
    with TickerProviderStateMixin {
  _TitleWidgetState({required this.title, this.animationController});

  String title;
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController!,
        curve: Interval((1 / 9) * 0, 1.0, curve: Curves.fastOutSlowIn)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation!.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        textAlign: TextAlign.left,
                        style: defaultTextTheme.headline1!.merge(TextStyle(
                            color: NyColors.of(context).primaryContent)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
