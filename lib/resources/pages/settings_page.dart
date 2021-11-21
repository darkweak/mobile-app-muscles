import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/list.dart';
import 'package:flutter_app/app/models/meridian.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/resources/widgets/layout.dart';
import 'package:flutter_app/resources/widgets/title_widget.dart';
import 'package:nylo_support/widgets/ny_state.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';

import '../../app/controllers/welcome_controller.dart';

class SettingsPage extends NyStatefulWidget {
  final WelcomeController controller = WelcomeController();

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends NyState<SettingsPage>
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
    return LayoutWidget(
        backable: false,
        title: "title.meridians",
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
                    ],
                  ),
                ],
              )
            : Container());
  }
}
