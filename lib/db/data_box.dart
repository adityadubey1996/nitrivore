import 'package:nutrivine/db/db.dart';
import 'package:objectbox/objectbox.dart';

class DataBox<T> {
  final DB _db = DB();
  late final Box<T> _box = _getBox();

  // Box() {
  //   _getBox();
  // }

  dynamic _getBox() {
    final box = _db.store.box<T>();
    return box;
  }

  bool save(T data) {
    try {
      _box.put(data);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool saveMany(List<T> data) {
    try {
      _box.putMany(data);
      return true;
    } catch (e) {
      return false;
    }
  }
}
