import 'package:flutter/material.dart';
import 'package:flutter_app/app/models/fileProvider.dart';
import 'package:nylo_framework/nylo_framework.dart';

import '../../main.dart';

class CurvedItemViewWidget<T extends FileProvider> extends StatelessWidget {
  const CurvedItemViewWidget(
      {Key? key, this.item})
      : super(key: key);

  final T? item;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 32, left: 8, right: 8, bottom: 16),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color:
                    HexColor(item!.endColor).withOpacity(0.6),
                    offset: const Offset(1.1, 4.0),
                    blurRadius: 8.0),
              ],
              gradient: LinearGradient(
                colors: <HexColor>[
                  HexColor(item!.startColor),
                  HexColor(item!.endColor),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(8.0),
                bottomLeft: Radius.circular(8.0),
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(54.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 80, left: 16, right: 16, bottom: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    translate(
                        context,
                        item!.getName() +
                            "." +
                            item!.element +
                            ".name"),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                      fontSize: 28,
                      letterSpacing: 0.2,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:
                      const EdgeInsets.only(top: 8, bottom: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              shape: BoxShape.circle,
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.white.withOpacity(0.1),
                    offset: Offset(16.0, 16.0),
                    blurRadius: 16.0),
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          left: 8,
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              getImageAsset(item!.element) + ".png",
              height: 100,
              width: 100,
            ),
          ),
        )
      ],
    );
  }
}
