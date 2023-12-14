import 'dart:convert';
import 'package:http/http.dart' as http;

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  List<dynamic> pemesananKereta = [];
  List<dynamic> jadwalKereta = [];
  List<dynamic> lokasiKereta = [];

  Future<void> ambilData() async {
    var url = 'https://pemrograman-pinnie.000webhostapp.com/kereta_list.php';
    var uri = Uri.parse(url);
    var response = await http.get(uri);
    var body = response.body;

    var json = jsonDecode(body);
    pemesananKereta =
        json['pemesanan_kereta']['pemesananData']['pemesanan_kereta'];
    jadwalKereta = json['jadwal_kereta']['jadwalData']['jadwal_kereta'];
    lokasiKereta = json['lokasi_kereta']['lokasiData']['lokasi_kereta'];
  }

  List<dynamic> getPesanan() {
    return pemesananKereta;
  }

  List<dynamic> getJadwal() {
    return jadwalKereta;
  }

  List<dynamic> getLokasi() {
    return lokasiKereta;
  }

  Future<int> updateTicket(int id, Map<String, dynamic> updatedData) async {
    var url = 'https://pemrograman-pinnie.000webhostapp.com/kereta_update.php';
    var uri = Uri.parse(url);

    updatedData['id'] = id;

    var response = await http.post(uri, body: updatedData);
    var body = response.body;
    var json = jsonDecode(body);

    if (json['success'] == 1) {
      // berhasil
      return 1;
    } else {
      // gagal
      return 0;
    }
  }

  Future<int> deleteTicket(int id) async {
    var url = 'https://pemrograman-pinnie.000webhostapp.com/kereta_delete.php';
    var uri = Uri.parse(url);

    var data = {'id': id.toString()};

    try {
      var response = await http.post(uri, body: data);
      var body = response.body;
      var json = jsonDecode(body);

      if (json['success'] == 1) {
        // Successfully deleted
        return 1;
      } else {
        // Failed to delete
        return 0;
      }
    } catch (error) {
      // Handle network or server errors
      print('Error deleting ticket: $error');
      return 0;
    }
  }
}

//   // only have a single app-wide reference to the database
//   static Database? _database;
//   Future<Database> get database async => _database ??= await _initDatabase();
//   Future<Database?> get database1 async {
//     if (_database == null) {
//       _database = await _initDatabase();
//     }
//     return _database;
//   }

//   // this opens the database (and creates it if it doesn't exist)
//   _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   // SQL code to create the database table
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $columnId INTEGER PRIMARY KEY,
//             $columnStart TEXT NOT NULL,
//             $columnEnd TEXT NOT NULL,
//             $columnDate TEXT NOT NULL
//           )
//           ''');
//   }

//   // Helper methods

//   // Inserts a row in the database where each key in the Map is a column name
//   // and the value is the column value. The return value is the id of the
//   // inserted row.
//   Future<int> insert(Map<String, dynamic> row) async {
//     Database? db = await instance.database;
//     return await db.insert(table, row);
//   }

//   // All of the rows are returned as a list of maps, where each map is
//   // a key-value list of columns.
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database db = await instance.database;
//     return await db.query(table);
//   }

//   // All of the methods (insert, query, update, delete) can also be done using
//   // raw SQL commands. This method uses a raw query to give the row count.
//   Future<int> queryRowCount() async {
//     Database db = await instance.database;
//     return Sqflite.firstIntValue(
//             await db.rawQuery('SELECT COUNT(*) FROM $table')) ??
//         0;
//   }

//   // We are assuming here that the id column in the map is set. The other
//   // column values will be used to update the row.
//   Future<int> update(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row[columnId];
//     return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
//   }

//   // Deletes the row specified by the id. The number of affected rows is
//   // returned. This should be 1 as long as the row exists.
//   Future<int> delete(int id) async {
//     Database db = await instance.database;
//     return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
//   }

