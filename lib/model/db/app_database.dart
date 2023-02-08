import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:customer_management/model/entity/customer.dart';

class AppDatabase {
  // 顧客テーブル
  final String _customerTableName = 'customer';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnAddress = 'address';

  Database? _database;

  // データベースのgetter
  Future<Database> get database async {
    return _database ??= await _initDatabase();
  }

  // データベース初期化
  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'customer_management.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createTable,
    );
  }

  // データベースがnullの場合テーブル作成
  Future<void> _createTable(Database db, int version) async {
    // idは自動採番(sqliteではINTEGER PRIMARY KEY)
    String sql = '''
      CREATE TABLE $_customerTableName(
        $_columnId INTEGER PRIMARY KEY,
        $_columnName TEXT,
        $_columnAddress TEXT
      )
    ''';

    return await db.execute(sql);
  }

  Future<List<Customer>> loadAllCustomer() async {
    final db = await database;
    var maps = await db.query(
      _customerTableName,
      orderBy: '$_columnName ASC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => fromMap(map)).toList();
  }

  Future<List<Customer>> search(String keyword) async {
    final db = await database;
    var maps = await db.query(
      _customerTableName,
      orderBy: '$_columnName DESC',
      where: '$_columnName LIKE ?',
      whereArgs: ['%$keyword%'],
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => fromMap(map)).toList();
  }

  Future insert(Customer customer) async {
    final db = await database;
    final row = toMap(customer);
    row.remove(_columnId);

    // idは自動採番のため除く
    return await db.insert(
        _customerTableName,
        row
    );
  }

  Future update(Customer customer) async {
    final db = await database;
    return await db.update(
      _customerTableName,
      toMap(customer),
      where: '$_columnId = ?',
      whereArgs: [customer.id],
    );
  }

  Future delete(Customer customer) async {
    final db = await database;
    return await db.delete(
      _customerTableName,
      where: '$_columnId = ?',
      whereArgs: [customer.id],
    );
  }

  Map<String, dynamic> toMap(Customer customer) {
    return {
      _columnId: customer.id,
      _columnName: customer.name,
      _columnAddress: customer.address,
    };
  }

  Customer fromMap(Map<String, dynamic> json) {
    return Customer(
      id: json[_columnId],
      name: json[_columnName],
      address: json[_columnAddress],
    );
  }
}
