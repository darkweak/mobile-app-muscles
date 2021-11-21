import 'package:flutter_app/app/models/fileProvider.dart';

class ItemData<T extends FileProvider> {
  Future<T> get(T item, String id) async {
    return await item.get(id);
  }
}
