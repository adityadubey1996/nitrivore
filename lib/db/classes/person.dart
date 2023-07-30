import 'package:objectbox/objectbox.dart';

@Entity()
class Person {
  Person(this.name);
  String name;
}
