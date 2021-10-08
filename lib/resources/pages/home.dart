import 'package:flutter/material.dart';
import 'package:flutter_app/app/controllers/home_controller.dart';
import 'package:flutter_app/resources/pages/meals_list_view.dart';
import 'package:nylo_framework/nylo_framework.dart';

class MyHomePage extends NyStatefulWidget {
  final HomeController controller = HomeController();
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends NyState<MyHomePage> {
  @override
  widgetDidLoad() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: MealsListView(),
    );
  }
}
