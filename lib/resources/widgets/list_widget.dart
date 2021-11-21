import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/fileProvider.dart';
import 'package:flutter_app/app/models/element.dart' as elementProvider;
import 'package:flutter_app/resources/widgets/list_item/element.dart';
import 'package:nylo_framework/nylo_framework.dart';

class ListWidget<T extends FileProvider> extends NyStatefulWidget {
  ListWidget(
      {Key? key,
      required this.items,
      required this.itemBuilder,
      this.animationController,
      this.inline = false,
      this.small = false})
      : super(key: key);

  final bool inline;
  final bool small;
  final Function itemBuilder;
  final List<T> items;
  final AnimationController? animationController;

  @override
  _ListWidgetState<T> createState() => _ListWidgetState(
      animationController: animationController,
      inline: inline,
      small: small,
      items: items,
      itemBuilder: itemBuilder);
}

class _ListWidgetState<T extends FileProvider> extends NyState<ListWidget>
    with TickerProviderStateMixin {
  _ListWidgetState(
      {required this.items,
      required this.itemBuilder,
      this.inline = false,
      this.small = false,
      this.animationController});

  final bool inline;
  final bool small;
  final List<T> items;
  final Function itemBuilder;
  AnimationController? animationController;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        if (!this.inline) {
          return GridView(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 24, right: 24),
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List<Widget>.generate(
              this.items.length,
              (int index) {
                animationController?.forward();
                return this.itemBuilder(this.items[index]);
              },
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: this.small ? 1.7 : 1.5,
              crossAxisCount: 2,
              mainAxisSpacing: 24.0,
              crossAxisSpacing: 24.0,
            ),
          );
        }
        return FadeTransition(
          opacity: animationController!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - animationController!.value), 0.0),
            child: Container(
              height: 216,
              width: double.infinity,
              child: ListView.builder(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 0, right: 16, left: 16),
                itemCount: items.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var item = items[index];
                  if (items.length == 0) {
                    return Container();
                  }

                  final int count = items.length > 10 ? 10 : items.length;

                  final Animation<double> animation =
                      Tween<double>(begin: 0.0, end: 1.0).animate(
                          CurvedAnimation(
                              parent: animationController!,
                              curve: Interval((1 / count) * index, 1.0,
                                  curve: Curves.fastOutSlowIn)));
                  animationController!.forward();

                  return AnimatedBuilder(
                    animation: animationController!,
                    builder: (BuildContext context, Widget? child) {
                      return FadeTransition(
                        opacity: animation,
                        child: Transform(
                          transform: Matrix4.translationValues(
                              100 * (1.0 - animation.value), 0.0, 0.0),
                          child: SizedBox(
                            width: 140,
                            child: ElementItemListWidget(
                                item: (item as elementProvider.Element)),
                          ),
                        ),
                      );
                    },
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
