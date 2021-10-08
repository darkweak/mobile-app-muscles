import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';

abstract class FileProvider {
  FileProvider({
    this.id = '',
    this.element = '',
    this.startColor = '',
    this.endColor = '',
  });

  String id;
  String element;
  String startColor;
  String endColor;

  String getName() {
    return "";
  }

  Future<dynamic> parseFile() async {
    String res = await rootBundle.loadString(getPublicAsset("data/list/" + this.getName() + ".json"));
    return json.decode(res);
  }

  Future<List<dynamic>> read() async {
    var parsedFile = await this.parseFile();
    return parsedFile["elements"] ?? [];
  }
}
