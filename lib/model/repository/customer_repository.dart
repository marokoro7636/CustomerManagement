import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';

class CustomerRepository {
  CustomerRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Customer>> loadAllCustomer() => _appDatabase.loadAllCustomer();

  Future<List<Customer>> loadCustomer(Customer customer)
    => _appDatabase.loadCustomer(customer);

  Future<List<Customer>> search(String keyword) => _appDatabase.searchCustomer(keyword);

  Future insert(Customer customer) => _appDatabase.insertCustomer(customer);

  Future update(Customer customer) => _appDatabase.updateCustomer(customer);

  Future delete(Customer customer) => _appDatabase.deleteCustomer(customer);
}
