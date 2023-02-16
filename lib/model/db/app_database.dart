import 'package:customer_management/model/entity/order.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:customer_management/model/entity/customer.dart';

class AppDatabase {
  // 顧客テーブル
  final String _customerTableName = 'customer';
  final String _columnId = 'id';
  final String _columnName = 'name';
  final String _columnAddress = 'address';

  // 注文テーブル
  final String _orderTableName = 'ordering';
  final String _columnCustomerId = 'customerId';
  final String _columnGoodsName = 'goodsName';
  final String _columnGoodsPrice = 'goodsPrice';

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
    final String sqlCustomer = '''
      CREATE TABLE $_customerTableName(
        $_columnId INTEGER PRIMARY KEY,
        $_columnName TEXT,
        $_columnAddress TEXT
      )
    ''';
    final String sqlOrder = '''
      CREATE TABLE $_orderTableName(
        $_columnId INTEGER PRIMARY KEY,
        $_columnCustomerId INTEGER,
        $_columnGoodsName TEXT,
        $_columnGoodsPrice INTEGER
      )
     ''';

    await db.execute(sqlCustomer);
    await db.execute(sqlOrder);
  }

  Future<List<Customer>> loadAllCustomer() async {
    final db = await database;
    var maps = await db.query(
      _customerTableName,
      orderBy: '$_columnName ASC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => Customer.fromJson(map)).toList();
  }

  Future<Customer> loadCustomerById(int customerId) async {
    final db = await database;
    var maps = await db.query(
      _customerTableName,
      orderBy: '$_columnName ASC',
      where: '$_columnId = ?',
      whereArgs: [customerId]
    );

    if (maps.isEmpty) return const Customer();

    return Customer.fromJson(maps[0]);
  }

  Future<List<Order>> loadAllOrder() async {
    final db = await database;
    var maps = await db.query(
      _orderTableName,
      orderBy: '$_columnGoodsName ASC',
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => Order.fromJson(map)).toList();
  }

  Future<List<Order>> loadOrder(Customer customer) async {
    final db = await database;
    var maps = await db.query(
      _orderTableName,
      orderBy: '$_columnGoodsName ASC',
      where: '$_columnCustomerId = ?',
      whereArgs: [customer.id]
    );

    if (maps.isEmpty) return [];

    return maps.map((map) => Order.fromJson(map)).toList();
  }

  Future insertCustomer(Customer customer) async {
    final db = await database;
    final row = customer.toJson();
    row.remove(_columnId);

    // idは自動採番のため除く
    return await db.insert(
        _customerTableName,
        row
    );
  }

  Future insertOrder(Order order) async {
    final db = await database;
    final row = order.toJson();
    row.remove(_columnId);

    // idは自動採番のため除く
    return await db.insert(
        _orderTableName,
        row
    );
  }

  Future updateCustomer(Customer customer) async {
    final db = await database;
    return await db.update(
      _customerTableName,
      customer.toJson(),
      where: '$_columnId = ?',
      whereArgs: [customer.id],
    );
  }

  Future updateOrder(Order order) async {
    final db = await database;
    return await db.update(
      _orderTableName,
      order.toJson(),
      where: '$_columnId = ?',
      whereArgs: [order.id],
    );
  }

  Future deleteCustomer(Customer customer) async {
    final db = await database;
    return await db.delete(
      _customerTableName,
      where: '$_columnId = ?',
      whereArgs: [customer.id],
    );
  }

  Future deleteOrder(Order order) async {
    final db = await database;
    return await db.delete(
      _orderTableName,
      where: '$_columnId = ?',
      whereArgs: [order.id],
    );
  }
}
