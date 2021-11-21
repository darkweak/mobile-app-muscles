import 'package:flutter_app/app/models/fileProvider.dart';

class Meridian extends FileProvider {
  Meridian({String name = '', this.element = '', this.image = ''})
      : super(name: name);

  String element;
  String image;

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
        name: item["prefix"],
        element: item["element"],
        image: item["image"]["large"],
      ));
    }

    return meridians;
  }
}
