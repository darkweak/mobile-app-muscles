import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/fileProvider.dart';
import 'package:flutter_app/config/app_theme.dart';

class BaseItemViewWidget<T extends FileProvider> extends StatelessWidget {
  const BaseItemViewWidget({Key? key, required this.children, this.onTap})
      : super(key: key);

  final List<Widget> children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var item = Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        color: NyColors.of(context).secondaryBackground,
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Stack(
        children: this.children,
      ),
    );

    if (this.onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: item,
      );
    }

    return item;
  }
}
