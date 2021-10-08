import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bootstrap/app.dart';
import 'package:flutter_app/resources/themes/dark_theme.dart';
import 'package:flutter_app/resources/themes/light_theme.dart';
import 'package:flutter_app/routes/router.dart';
import 'package:nylo_framework/nylo_framework.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Nylo nylo = await Nylo.init(router: buildRouter());
  AppLocale.instance.locale = Locale('fr');

  runApp(
    AppBuild(
      navigatorKey: nylo.router!.navigatorKey,
      onGenerateRoute: nylo.router!.generator(),
      lightTheme: lightTheme(),
      darkTheme: darkTheme(),
      locale: AppLocale.instance.locale,
    ),
  );
}

String getFormattedJSON(String inner) {
  return inner
      .replaceAllMapped(RegExp(r'\b\w+\b'), (match) {
        return '"${match.group(0)}"';
      })
      .replaceAllMapped(': }', (match) {
        return ':""}';
      })
  ;
}

String recursiveTranslation(String? keys, List<String> l) {
  if (l.length == 0) {
    return keys ?? "";
  }

  var value = json.decode(keys ?? "")[l.removeAt(0)];
  if (value.length != 0 && ["{", "["].contains(value.toString()[0])) {
    return recursiveTranslation(getFormattedJSON(value.toString()), l);
  }

  return value ?? "";
}

String translate(BuildContext context, String key) {
  var keys = key.split(".");
  var value = AppLocalizations.of(context)!.trans(keys.removeAt(0));
  return recursiveTranslation(getFormattedJSON(value ?? ""), keys);
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
