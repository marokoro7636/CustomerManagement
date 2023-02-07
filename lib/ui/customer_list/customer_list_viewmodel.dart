import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';

final customerListProvider =
StateNotifierProvider<CustomerListViewModel, List<Customer>>(
        (ref) => CustomerListViewModel());

class CustomerListViewModel extends StateNotifier<List<Customer>> {
  CustomerListViewModel() : super([]) {
    loadAllCustomer();
  }

  final _repository = CustomerRepository(AppDatabase());

  void loadAllCustomer() async {
    state = await _repository.loadAllCustomer();
  }
}