import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/muscle.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../main.dart';
import '../base_item_widget.dart';

class MuscleItemListWidget<T extends Muscle> extends StatelessWidget {
  const MuscleItemListWidget({Key? key, required this.item}) : super(key: key);

  final T item;

  @override
  Widget build(BuildContext context) {
    return BaseItemViewWidget(
        onTap: () {
          Navigator.pushNamed(context, "/muscle", arguments: item.name);
        },
        children: [
          Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                  getImageAsset(item.imagePrefix),
                  height: 100,
                  width: 100,
                ),
              )),
          Padding(
            padding:
                const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    translate(
                        context, item.getName() + "." + item.name + ".name"),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                      letterSpacing: 0.27,
                      color: NyColors.of(context).primaryContent,
                    ),
                  ),
                ),
              ],
            ),
          )
        ]);
  }
}
