import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/entity/order.dart';

class OrderRepository {
  OrderRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Order>> loadAllOrder() => _appDatabase.loadAllOrder();

  Future<List<Order>> loadOrder(Customer customer)
    => _appDatabase.loadOrder(customer);

  Future insert(Order order) => _appDatabase.insertOrder(order);

  Future update(Order order) => _appDatabase.updateOrder(order);

  Future delete(Order order) => _appDatabase.deleteOrder(order);
}
