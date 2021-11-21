import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/bottom_navigation.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/light_theme.dart';
import 'package:flutter_app/resources/widgets/bottom_navigation_widget.dart';
import 'package:flutter_app/resources/widgets/floating_action_button_widget.dart';
import 'package:flutter_app/resources/widgets/list_widget.dart';
import 'package:flutter_app/resources/widgets/title_widget.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

import 'app/models/fileProvider.dart';
import 'config/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(router: buildRouter());
  AppLocale.instance.locale = Locale('fr');
  runApp(new MaterialApp(
      home: ThemeProvider(
    themes: [
      AppTheme(
          id: ThemeConfig.lightThemeId(),
          data: lightTheme(),
          description: 'Light theme'),
      AppTheme(
          id: ThemeConfig.darkThemeId(),
          data: darkTheme(),
          description: 'Dark theme'),
    ],
    child: ThemeConsumer(
      child: Scaffold(
        body: AppBuild(
          navigatorKey: nylo.router!.navigatorKey,
          onGenerateRoute: nylo.router!.generator(),
          lightTheme: lightTheme(),
          darkTheme: darkTheme(),
          locale: AppLocale.instance.locale,
        ),
        bottomNavigationBar:
            BottomNavigationWidget(items: TabIconData.tabIconsList),
        floatingActionButton: FloatingActionButtonWidget(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    ),
  )));
}

String recursiveTranslation(dynamic keys, List<String> l) {
  if (l.length == 0) {
    return keys ?? "";
  }

  var value = keys[l.removeAt(0)];
  if (value != null && value.length != 0 && l.length > 0) {
    return recursiveTranslation(value, l);
  }

  return value ?? "";
}

String translate(BuildContext context, String key) {
  var keys = key.split(".");
  var value = AppLocalizations.of(context)!.trans(keys.removeAt(0));
  return recursiveTranslation(value, keys);
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}

List<Widget> buildList(
  BuildContext context,
  AnimationController? animationController,
  List<FileProvider> elements,
  String title,
  Function itemBuilder, {
  bool inline = false,
  bool small = false,
}) {
  return [
    Container(
      padding: EdgeInsets.only(bottom: 24.0, top: 24.0),
      child: TitleWidget(
        animationController: animationController,
        title: translate(context, title),
      ),
    ),
    ListWidget<FileProvider>(
        inline: inline,
        small: small,
        animationController: animationController,
        itemBuilder: itemBuilder,
        items: elements),
  ];
}
