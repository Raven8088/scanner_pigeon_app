import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../../dto/scanner/scanned_code_dto.dart';

class ScannedCodeProvider {
  static const String _tableName = 'scanned_codes';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'scanner.db');

    return await openDatabase(
      path,
      version: 2, // 🔥 Subimos la versión para que se ejecute onUpgrade()
      onCreate: (db, version) async {
        await db.execute('''
        CREATE TABLE $_tableName (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          content TEXT NOT NULL,
          type TEXT NOT NULL, -- 🔥 Ahora sí la agregamos
          timestamp TEXT NOT NULL
        )
      ''');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          // 🔥 Agregamos la columna "type" sin borrar la tabla ni los datos existentes
          await db.execute(
              "ALTER TABLE $_tableName ADD COLUMN type TEXT DEFAULT 'TEXT'");
        }
      },
    );
  }

  Future<void> insertCode(ScannedCodeDTO dto) async {
    final db = await database;
    await db.insert(
      _tableName,
      dto.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ScannedCodeDTO>> getAllCodes() async {
    final db = await database;
    final maps = await db.query(_tableName, orderBy: 'timestamp DESC');
    return maps.map((map) => ScannedCodeDTO.fromMap(map)).toList();
  }

  Future<void> deleteAll() async {
    final db = await database;
    await db.delete(_tableName);
  }

  Future<void> deleteById(int id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> dropTable() async {
    final db = await database;
    await db.execute("DROP TABLE IF EXISTS scanned_codes");
  }

  Future<void> createTableIfNotExists() async {
    final db = await database;
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $_tableName (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      content TEXT NOT NULL,
      type TEXT NOT NULL,
      timestamp TEXT NOT NULL
    )
  ''');
  }
}
