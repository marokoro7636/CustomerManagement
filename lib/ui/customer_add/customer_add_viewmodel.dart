import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';

final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
final customerEditProvider =
    StateNotifierProvider<CustomerEditViewModel, Customer>(
            (ref) => CustomerEditViewModel());

class CustomerEditViewModel extends StateNotifier<Customer> {
  CustomerEditViewModel() :
        super(const Customer(
          id: 0,
          name: '',
          address: ''
      ));

  final _repository = CustomerRepository(AppDatabase());

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setAddress(String address) {
    state = state.copyWith(address: address);
  }

  void save() async {
    await _repository.insert(state);
  }

}