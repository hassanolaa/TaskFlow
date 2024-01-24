import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class database {

  static Database? _database;

  Future<Database?> get getInstance async {
    if(_database == null){
      _database = await Instance();
      return _database;
    }else{
      return _database;
    }
  }


  Instance() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'sqlite.db');
    // open the database
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          '''CREATE TABLE TASK (id INTEGER  PRIMARY KEY AUTOINCREMENT, taskname TEXT ,contant TEXT , category INTEGER , done INTEGER )''');
    });
    print("Database created");
    return database;
  }

  inquiry(String sqltxt) async{
   Database? db = await getInstance;
   List<Map> maps = await db!.rawQuery(sqltxt);
   return maps;

  }

  insert(String sqltxt) async{
   Database? db = await getInstance;
    int count=await db!.rawInsert(sqltxt);
   return count;

  }

  delete(String sqltxt) async{
   Database? db = await getInstance;
    int count = await db!.rawDelete(sqltxt);
    return count;

  }

  update(String sqltxt) async{
   Database? db = await getInstance;
   int count = await db!.rawUpdate(sqltxt);
   return count;

  }





}
