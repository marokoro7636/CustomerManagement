import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';
import 'package:tuple/tuple.dart';

final customerEditProvider =
    StateNotifierProvider.family<CustomerEditViewModel, CustomerEditState, CustomerEditState>(
            (ref, customer) => CustomerEditViewModel(customer));

class CustomerEditViewModel extends StateNotifier<CustomerEditState> {
  CustomerEditViewModel(CustomerEditState customer) :
        super(customer);

  final _repository = CustomerRepository(AppDatabase());

  void setName(String name) {
    state = state.copyWith(customer: state.customer.copyWith(name: name));
  }

  void setAddress(String address) {
    state = state.copyWith(customer: state.customer.copyWith(address: address));
  }

  void save() async {
    if(state.addMode) {
      await _repository.insert(state.customer);
    } else {
      await _repository.update(state.customer);
      // TODO 顧客詳細画面に戻る
    }
  }

}