import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/meridian.dart';
import 'package:flutter_app/config/app_theme.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../../main.dart';
import '../base_item_widget.dart';

class MeridianItemListWidget<T extends Meridian> extends StatelessWidget {
  const MeridianItemListWidget({Key? key, required this.item})
      : super(key: key);

  final T item;

  @override
  Widget build(BuildContext context) {
    return BaseItemViewWidget(children: [
      Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              getImageAsset((item as Meridian).image),
              height: 100,
              width: 100,
            ),
          )),
      Positioned(
        top: -40,
        left: 0,
        child: Text(
          translate(context, item.getName() + "." + item.name + ".letter"),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 88,
            letterSpacing: 0.27,
            color: Colors.grey[400]?.withOpacity(0.4),
          ),
        ),
      ),
      Padding(
        padding:
            const EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
        child: Stack(
          children: [
            Text(
              translate(context, item.getName() + "." + item.name + ".name"),
              textAlign: TextAlign.left,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                letterSpacing: 0.27,
                color: NyColors.of(context).primaryContent,
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
