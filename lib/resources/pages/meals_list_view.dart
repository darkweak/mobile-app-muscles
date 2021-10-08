import 'package:flutter/material.dart';
import 'package:flutter_app/app/data/list.dart';
import 'package:flutter_app/app/models/meridian.dart';
import 'package:flutter_app/resources/widgets/curved_item_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MealsListView extends NyStatefulWidget {
  MealsListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;

  @override
  _MealsListViewState createState() => _MealsListViewState();
}

class _MealsListViewState extends NyState<MealsListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Meridian> mealsListData = [];

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  widgetDidLoad() async {
    var list = await ListData<Meridian>().getList(Meridian());
    setState(() {
      mealsListData = list;
    });
    await Future<dynamic>.delayed(const Duration(milliseconds: 50));
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: this.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: this.animationController!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - this.animationController!.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: mealsListData.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  if (mealsListData.length == 0) {
                    return Container();
                  }

                  final int count =
                      mealsListData.length > 10 ? 10 : mealsListData.length;

                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController?.forward();

                  return MealsView(
                    mealsListData: mealsListData[index],
                    animation: animation,
                    animationController: animationController!,
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class MealsView extends StatelessWidget {
  const MealsView(
      {Key? key, this.mealsListData, this.animationController, this.animation})
      : super(key: key);

  final Meridian? mealsListData;
  final AnimationController? animationController;
  final Animation<double>? animation;

  @override
  Widget build(BuildContext context) {
    return CurvedItemViewWidget<Meridian>(
      item: this.mealsListData,
    );
  }
}
