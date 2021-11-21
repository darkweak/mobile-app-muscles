import 'package:flutter/material.dart';
import 'base_styles.dart';

/*
|--------------------------------------------------------------------------
| Light Theme Colors
|--------------------------------------------------------------------------
*/

class LightThemeColors implements BaseStyles {
  // general
  Color get background => const Color(0xFFFFFFFF);
  Color get secondaryBackground => const Color(0xFFF8FAFB);
  Color get primaryContent => const Color(0xFF000000);
  Color get primaryColoredContent => Colors.indigo;
  Color get primaryAccent => const Color(0xFF87c694);

  // app bar
  Color get appBarBackground => Colors.indigo;
  Color get appBarPrimaryContent => Colors.white;

  // buttons
  Color get buttonBackground => Colors.indigoAccent;
  Color get buttonPrimaryContent => Colors.white;

  // bottom tab bar
  Color get bottomTabBarBackground => Colors.white;

  // bottom tab bar - icons
  Color get bottomTabBarIconSelected => Colors.indigo;
  Color get bottomTabBarIconUnselected => Colors.black54;

  // bottom tab bar - label
  Color get bottomTabBarLabelUnselected => Colors.black45;
  Color get bottomTabBarLabelSelected => Colors.black;

  // Gradients
  Color get gradientAddButtonStart => const Color(0xFFFA7D82);
  Color get gradientAddButtonStop => const Color(0xFFFFB295);
}
