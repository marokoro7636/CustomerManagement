import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/entity/order.dart';
import 'package:customer_management/model/entity/goods_summary.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final orderRepositoryProvider =
    Provider((ref) => OrderRepository(ref.watch(appDataBaseProvider)));

class OrderRepository {
  OrderRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Order>> loadOrder(Customer customer) =>
      _appDatabase.loadOrder(customer);

  Future insert(Order order) => _appDatabase.insertOrder(order);

  Future update(Order order) => _appDatabase.updateOrder(order);

  Future delete(Order order) => _appDatabase.deleteOrder(order);

  Future<List<GoodsSummary>> groupOrderByName(int year) =>
      _appDatabase.groupOrderByName(year);
}
