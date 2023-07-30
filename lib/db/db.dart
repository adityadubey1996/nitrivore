import 'dart:io';

import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';

class DB {
  late Store _store;
  Store get store => _store;

  // next three lines makes this class a Singleton
  static final DB _instance = DB.internal();
  DB.internal();
  factory DB() => _instance;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get dbPath async {
    final path = await _localPath;
    return '$path/object_box';
  }

  // Future<void> getStore(String path) async {
  //   if (Store.isOpen(path)) {
  //     _store = Store.attach(getObjectBoxModel(), path);
  //   } else {
  //     _store = await openStore(directory: path, maxDBSizeInKB: dbSizeInKB);
  //   }
  // }

  // Future<void> initialize() async {
  //   String path = await dbPath;
  //   await getStore(path).then((value) {});
  // }

  Future<int?> getDBSize() async {
    String path = await dbPath;
    Directory directory = Directory(path).absolute;
    if (directory.existsSync()) {
      int size = 0;
      List<FileSystemEntity> list = Directory(path).listSync();
      for (var file in list) {
        file as File;
        size += file.lengthSync();
      }
      return size;
    }
    return null;
  }

  Future<void> dispose() async {
    String path = await dbPath;
    if (Store.isOpen(path)) {
      _store.close();
    }
  }
}
