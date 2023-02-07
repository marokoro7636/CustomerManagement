import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';

class CustomerRepository {
  CustomerRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Customer>> loadAllCustomer() => _appDatabase.loadAllCustomer();

  Future<List<Customer>> search(String keyword) => _appDatabase.search(keyword);

  Future insert(Customer customer) => _appDatabase.insert(customer);

  Future update(Customer customer) => _appDatabase.update(customer);

  Future delete(Customer customer) => _appDatabase.delete(customer);
}
