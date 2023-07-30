import 'package:nutrivine/db/classes/person.dart';
import 'package:nutrivine/db/db.dart';
import 'package:objectbox/objectbox.dart';

class PersonRepo {
  final DB _db = DB();
  late final Box<Person> _box = _db.store.box<Person>();
}
