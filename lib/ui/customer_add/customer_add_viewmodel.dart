import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:uuid/uuid.dart';

final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
final customerEditProvider =
    StateNotifierProvider<CustomerEditViewModel, Customer>(
            (ref) => CustomerEditViewModel());

class CustomerEditViewModel extends StateNotifier<Customer> {
  CustomerEditViewModel() :
        super(const Customer(
          id: 'Uuid().v4()',
          name: '',
          address: ''
      ));

  final _repository = CustomerRepository(AppDatabase());



  void addCustomer() {
    print('OK');
  }

}