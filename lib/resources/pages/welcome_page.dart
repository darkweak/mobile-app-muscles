import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/bottom_navigation.dart';
import 'package:flutter_app/app/data/list.dart';
import 'package:flutter_app/app/models/meridian.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/resources/widgets/bottom_navigation_widget.dart';
import 'package:flutter_app/resources/widgets/list_widget.dart';
import 'package:flutter_app/resources/widgets/theme_switcher_widget.dart';
import 'package:flutter_app/resources/widgets/title_widget.dart';
import 'package:nylo_support/widgets/ny_state.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';

import '../../app/controllers/welcome_controller.dart';

class WelcomePage extends NyStatefulWidget {
  final WelcomeController controller = WelcomeController();
  final String title;

  WelcomePage({Key? key, required this.title}) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends NyState<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Meridian> meridiansList = [];

  @override
  widgetDidLoad() async {
    var list = await ListData<Meridian>().getList(Meridian());
    setState(() {
      meridiansList = list;
      animationController = AnimationController(
          duration: const Duration(milliseconds: 2000), vsync: this);
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  }

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NyColors.of(context).appBarBackground,
      child: Scaffold(
        appBar: AppBar(
          title: Text(translate(context, "title.home")),
          actions: [
            ThemeSwitcherWidget(),
          ],
        ),
        body: meridiansList.length > 0
            ? Stack(
          children: <Widget>[
            ListView(
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 24.0, top: 24.0),
                  child: TitleWidget(
                    animationController: animationController,
                    title: translate(context, "title.meridians"),
                  ),
                ),
                ListWidget<Meridian>(animationController: animationController, items: meridiansList),
              ],
            ),
            Column(
              children: <Widget>[
                const Expanded(
                  child: SizedBox(),
                ),
                BottomNavigationWidget(items: TabIconData.tabIconsList),
              ],
            ),
          ],
        )
            : Container(),
      ),
    );
  }
}
