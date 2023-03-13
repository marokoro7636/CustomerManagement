import 'package:customer_management/model/db/app_database.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customerRepositoryProvider =
    Provider((ref) => CustomerRepository(ref.watch(appDataBaseProvider)));

class CustomerRepository {
  CustomerRepository(this._appDatabase);

  final AppDatabase _appDatabase;

  Future<List<Customer>> loadAllCustomer() => _appDatabase.loadAllCustomer();

  Future insert(Customer customer) => _appDatabase.insertCustomer(customer);

  Future update(Customer customer) => _appDatabase.updateCustomer(customer);

  Future delete(Customer customer) => _appDatabase.deleteCustomer(customer);
}
