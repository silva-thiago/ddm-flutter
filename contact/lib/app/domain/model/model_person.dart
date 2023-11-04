import 'package:uuid/uuid.dart';

class Person {
  final String personTable = 'personTable';
  final String personIdColumn = 'personIdColumn';
  final String personNameColumn = 'personNameColumn';
  final String personEmailColumn = 'personEmailColumn';
  final String personPhoneColumn = 'personPhoneColumn';
  final String personPhotoColumn = 'personPhotoColumn';

  Person();

  int id = 0;
  String name = '';
  String email = '';
  String phone = '';
  String photo = '';

  Person.fromMap(Map map) {
    id = map['personIdColumn'] ?? const Uuid().v4();
    name = map['personNameColumn'];
    email = map['personEmailColumn'];
    phone = map['personPhoneColumn'];
    photo = map['personPhotoColumn'];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      'personIdColumn': id,
      'personNameColumn': name,
      'personEmailColumn': email,
      'personPhoneColumn': phone,
      'personPhotoColumn': photo
    };

    if (id != 0) {
      map['personIdColumn'] = id;
    }

    return map;
  }

  @override
  String toString() {
    return 'Person{personIdColumn: $personIdColumn, personNameColumn: $personNameColumn, personEmailColumn: $personEmailColumn, personPhoneColumn: $personPhoneColumn, personPhotoColumn: $personPhotoColumn}';
  }
}
