import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:nylo_framework/nylo_framework.dart';

abstract class FileProvider {
  FileProvider({
    this.startColor = '',
    this.endColor = '',
    this.name = '',
  });

  String name;
  String startColor;
  String endColor;

  String getName() {
    return "";
  }

  Future<dynamic> parseFile() async {
    String res = await rootBundle
        .loadString(getPublicAsset("data/list/" + this.getName() + ".json"));
    return json.decode(res);
  }

  Future<List<dynamic>> read() async {
    var parsedFile = await this.parseFile();
    return parsedFile["elements"] ?? [];
  }

  Future<dynamic> get(String id, {String key = 'prefix'}) async {
    var parsedFile = await this.parseFile();
    var items = parsedFile["elements"];
    for (var item in items) {
      if (item[key] == id) {
        return item;
      }
    }

    return null;
  }
}
