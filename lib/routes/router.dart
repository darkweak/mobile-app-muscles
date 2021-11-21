import 'package:flutter_app/resources/pages/atlas_page.dart';
import 'package:flutter_app/resources/pages/emotions_page.dart';
import 'package:flutter_app/resources/pages/muscle_id_page.dart';
import 'package:flutter_app/resources/pages/muscles_page.dart';
import 'package:flutter_app/resources/pages/parameters_page.dart';
import 'package:flutter_app/resources/pages/settings_page.dart';
import 'package:flutter_app/resources/pages/welcome_page.dart';
import 'package:nylo_framework/nylo_framework.dart';

/*
|--------------------------------------------------------------------------
| App Router
|
| * [Tip] Create pages faster 🚀
| // Run the below in the terminal to create new a page and controller.
| // "flutter pub run nylo_framework:main make:page my_page -c"
| // Learn more https://nylo.dev/docs/2.x/router
|--------------------------------------------------------------------------
*/

buildRouter() => nyRoutes((router) {
      // base route stacks
      router.route("/", (context) => WelcomePage());
      router.route("/atlas", (context) => AtlasPage());
      router.route("/muscles", (context) => MusclesPage());
      router.route("/muscle", (context) => MuscleIdPage());
      router.route("/emotions", (context) => EmotionsPage());
      router.route("/parameters", (context) => ParametersPage());

      router.route("/testing", (context) => SettingsPage());
    });
