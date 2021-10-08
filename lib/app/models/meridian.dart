import 'package:flutter_app/app/models/fileProvider.dart';

class Meridian extends FileProvider {
  Meridian(
      {String id = '',
      String element = '',
      String startColor = '',
      String endColor = '',
      this.translations = ''})
      : super(
            id: id,
            element: element,
            startColor: startColor,
            endColor: endColor);

  String translations;

  @override
  String getName() {
    return "meridians";
  }

  @override
  Future<List<Meridian>> read() async {
    List data = await super.read();
    List<Meridian> meridians = [];

    for (var item in data) {
      meridians.add(Meridian(
        id: item["id"],
        element: item["element"],
        startColor: item["start_color"],
        endColor: item["end_color"],
      ));
    }

    return meridians;
  }
}
