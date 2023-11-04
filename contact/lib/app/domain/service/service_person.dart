import 'package:contacts/app/domain/model/model_person.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class PersonHelper {
  static final PersonHelper _instance = PersonHelper.internal();

  factory PersonHelper() => _instance;

  PersonHelper.internal();

  Database? _database;

  Future<Database?> get database async {
    _database ??= await initDatabase();

    return _database;
  }

  Future<Database> initDatabase() async {
    String databasesPath = await getDatabasesPath();

    if (databasesPath.isEmpty) {
      databasesPath = "";
    }

    String path = join(databasesPath, "person.db");

    const String sql = 'CREATE TABLE personTable('
        'personIdColumn UUID PRIMARY KEY AUTOINCREMENT, '
        'personNameColumn TEXT, '
        'personEmailColumn TEXT, '
        'personPhoneColumn TEXT, '
        'personPhotoColumn TEXT)';

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int newerVersion) async {
        await db.execute(sql);
      },
    );
  }

  Future<Person> savePerson(Person person) async {
    Database? dbPerson = await database;

    person.id = await dbPerson!.insert(person.personTable, person.toMap());

    return person;
  }

  Future<int> updatePerson(Person person) async {
    Database? dbPerson = await database;

    return await dbPerson!.update(
      person.personTable,
      person.toMap(),
      where: 'personIdColumn = ?',
      whereArgs: [person.id],
    );
  }

  Future<List<Person>> getAllPersons() async {
    Database? dbPerson = await database;

    List<Map> maps = await dbPerson!.rawQuery('SELECT * FROM personTable');

    List<Person> persons = [];

    for (Map map in maps) {
      persons.add(Person.fromMap(map));
    }

    return persons;
  }

  Future<Person?> getPerson(int id) async {
    Database? dbPerson = await database;

    List<Map> maps = await dbPerson!.query(
      'personTable',
      columns: [
        'personIdColumn',
        'personNameColumn',
        'personEmailColumn',
        'personPhoneColumn',
        'personPhotoColumn'
      ],
      where: 'personIdColumn = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Person.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deletePerson(int id) async {
    Database? dbPerson = await database;

    return await dbPerson!.delete(
      'personTable',
      where: 'personIdColumn = ?',
      whereArgs: [id],
    );
  }

  Future<int?> getNumber() async {
    Database? dbPerson = await database;

    return Sqflite.firstIntValue(
      await dbPerson!.rawQuery('SELECT COUNT(*) FROM personTable'),
    );
  }
}
