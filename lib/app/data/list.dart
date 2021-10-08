import 'package:flutter_app/app/models/fileProvider.dart';

class ListData<T extends FileProvider> {
  Future<List<T>> getList(T list) async {
    return (await list.read()).cast<T>();
  }

  static List<ListData<dynamic>> tabIconsList = <ListData<dynamic>>[];
}
