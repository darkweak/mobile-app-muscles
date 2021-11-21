import 'package:flutter_app/app/models/fileProvider.dart';

class Element extends FileProvider {
  Element({String name = '', String startColor = '', String endColor = ''})
      : super(name: name, startColor: startColor, endColor: endColor);

  @override
  String getName() {
    return "elements";
  }

  @override
  Future<List<Element>> read() async {
    List data = await super.read();
    List<Element> elements = [];

    for (var item in data) {
      elements.add(Element(
        name: item["element"],
        startColor: item["start_color"],
        endColor: item["end_color"],
      ));
    }

    return elements;
  }
}
