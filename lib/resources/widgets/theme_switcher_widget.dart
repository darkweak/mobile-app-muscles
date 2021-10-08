import 'package:flutter/material.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/resources/themes/styles/dark_theme_colors.dart';
import 'package:nylo_framework/theme/helper/ny_theme.dart';

class ThemeSwitcherWidget extends StatefulWidget {
  @override
  _ThemeSwitcherWidgetState createState() => _ThemeSwitcherWidgetState(nextTheme: nextTheme);

  late String nextTheme = "Light";
}

class _ThemeSwitcherWidgetState extends State<ThemeSwitcherWidget> {
  _ThemeSwitcherWidgetState({ required nextTheme });

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      setState(() {
        widget.nextTheme = NyColors.of(context).runtimeType == DarkThemeColors ? 'Light' : 'Dark';
      });
      NyTheme.set(context, id: "default_" + widget.nextTheme.toLowerCase() + "_theme");
    }, child: Icon(
        Icons.dark_mode_outlined,
        color: Colors.white,
        size: 24.0,
        semanticLabel: widget.nextTheme + " Theme Switcher",
      ),
    );
  }
}
