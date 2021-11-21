import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/element.dart' as elementProvider;
import 'package:flutter_app/resources/widgets/curved_item_widget.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ElementItemListWidget<T extends elementProvider.Element>
    extends StatelessWidget {
  const ElementItemListWidget({Key? key, required this.item}) : super(key: key);

  final T item;

  @override
  Widget build(BuildContext context) {
    return CurvedItemViewWidget(
        image: getImageAsset(item.name),
        text: item.getName() + "." + item.name + ".name",
        startColor: item.startColor,
        endColor: item.endColor);
  }
}
