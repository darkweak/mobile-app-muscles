import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/list.dart';
import 'package:flutter_app/app/models/muscle.dart';
import 'package:flutter_app/resources/widgets/layout.dart';
import 'package:flutter_app/resources/widgets/list_item/muscle.dart';
import 'package:nylo_framework/nylo_framework.dart';
import 'package:nylo_support/widgets/ny_state.dart';

import '../../main.dart';

class MusclesPage extends NyStatefulWidget {
  @override
  _MusclesPageState createState() => _MusclesPageState();
}

class _MusclesPageState extends NyState<MusclesPage>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Muscle> musclesList = [];

  List<Widget> groupMuscles(List<Muscle> muscles, BuildContext context) {
    Map<String, List<Muscle>> mappedMuscles = Map();
    List<Widget> widgets = [];

    Set.from(muscles).forEach((element) {
      if (mappedMuscles[(element as Muscle).meridian] == null) {
        mappedMuscles[element.meridian] = [];
      }
      mappedMuscles[element.meridian]?.add(element);
    });

    mappedMuscles.forEach((key, value) {
      widgets.addAll(buildList(
        context,
        animationController,
        value,
        "meridians." + key + ".name",
        (item) => MuscleItemListWidget(item: item as Muscle),
        small: true,
      ));
    });

    return widgets;
  }

  @override
  widgetDidLoad() async {
    var muscles = await ListData<Muscle>().getList(Muscle());
    setState(() {
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
        backable: false,
        title: "title.muscles",
        body: musclesList.length > 0
            ? ListView(
                children: groupMuscles(musclesList, context),
              )
            : Container());
  }
}
