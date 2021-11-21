import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/resources/widgets/theme_switcher_widget.dart';

class LayoutWidget extends StatelessWidget {
  final String title;
  final Widget? body;
  final bool? backable;

  LayoutWidget({required this.title, this.body, this.backable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: NyColors.of(context).appBarBackground,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: backable as bool,
            title: Text(translate(context, this.title)),
            actions: [
              ThemeSwitcherWidget(),
            ],
          ),
          body: Stack(
            children: [
              Container(
                child: this.body,
              ),
              Column(
                children: <Widget>[
                  const Expanded(
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
