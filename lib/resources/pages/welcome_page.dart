import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/list.dart';
import 'package:flutter_app/app/models/element.dart' as elt;
import 'package:flutter_app/app/models/meridian.dart';
import 'package:flutter_app/app/models/muscle.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_app/resources/widgets/layout.dart';
import 'package:flutter_app/resources/widgets/list_item/meridian.dart';
import 'package:flutter_app/resources/widgets/list_item/muscle.dart';
import 'package:nylo_support/widgets/ny_state.dart';
import 'package:nylo_support/widgets/ny_stateful_widget.dart';

import '../../app/controllers/welcome_controller.dart';

class WelcomePage extends NyStatefulWidget {
  final WelcomeController controller = WelcomeController();

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends NyState<WelcomePage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<elt.Element> elementsList = [];
  List<Meridian> meridiansList = [];
  List<Muscle> musclesList = [];

  @override
  widgetDidLoad() async {
    var elements = await ListData<elt.Element>().getList(elt.Element());
    var meridians = await ListData<Meridian>().getList(Meridian());
    var muscles = await ListData<Muscle>().getList(Muscle());
    setState(() {
      elementsList = elements;
      meridiansList = meridians;
      musclesList = muscles;
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
        title: "title.home",
        body: elementsList.length > 0
            ? ListView(
                children: <Widget>[
                  ...buildList(context, animationController, elementsList,
                      "title.elements", () => {},
                      inline: true),
                  ...buildList(
                      context,
                      animationController,
                      meridiansList,
                      "title.meridians",
                      (item) => MeridianItemListWidget(item: item as Meridian)),
                  ...buildList(
                    context,
                    animationController,
                    musclesList,
                    "title.muscles",
                    (item) => MuscleItemListWidget(item: item as Muscle),
                    small: true,
                  ),
                ],
              )
            : Container());
  }
}
