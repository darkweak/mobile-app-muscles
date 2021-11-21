import 'package:flutter_app/app/models/fileProvider.dart';

class Correction extends FileProvider {
  Correction({String name = ''}) : super(name: name);

  @override
  String getName() {
    return "corrections";
  }

  @override
  Future<List<Correction>> read() async {
    List data = await super.read();
    List<Correction> corrections = [];

    for (var item in data) {
      corrections.add(Correction(name: item["description"]));
    }

    return corrections;
  }
}
