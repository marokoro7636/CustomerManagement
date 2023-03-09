import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';
import 'package:customer_management/model/db/app_database.dart';

final customerEditProvider =
    StateNotifierProvider<CustomerEditViewModel, CustomerEditState>(
        (ref) => throw UnimplementedError());

class CustomerEditViewModel extends StateNotifier<CustomerEditState> {
  CustomerEditViewModel(CustomerEditState customer) : super(customer);

  final customerRepository = CustomerRepository(AppDatabase());

  final globalKey = GlobalKey<FormState>();

  void setName(String value) {
    state = state.copyWith(customer: state.customer.copyWith(name: value));
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return '氏名を入力してください';
    }
    return null;
  }

  void setNameKana(String value) {
    state = state.copyWith(customer: state.customer.copyWith(nameKana: value));
  }

  String? validateNameKana(String? value) {
    if (value == null || value.isEmpty) {
      return '氏名(ひらがな)を入力してください';
    }
    return null;
  }

  void setPostCode(String value) {
    state = state.copyWith(customer: state.customer.copyWith(postCode: value));
  }

  String? validatePostCode(String? value) {
    if (value == null || value.isEmpty) {
      return '郵便番号を入力してください';
    }
    if (value.length != 7) {
      return '郵便番号は7桁です';
    }
    return null;
  }

  void setAddress(String value) {
    state = state.copyWith(customer: state.customer.copyWith(address: value));
  }

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return '住所を入力してください';
    }
    return null;
  }

  void setAccountName(String value) {
    state =
        state.copyWith(customer: state.customer.copyWith(accountName: value));
  }

  String? validateAccountName(String? value) {
    if (value == null || value.isEmpty) {
      return 'アカウント名を入力してください';
    }
    return null;
  }

  void setAccountId(String value) {
    state = state.copyWith(customer: state.customer.copyWith(accountId: value));
  }

  String? validateAccountId(String? value) {
    if (value == null || value.isEmpty) {
      return 'アカウントIDを入力してください';
    }
    return null;
  }

  void setNotes(String value) {
    state = state.copyWith(customer: state.customer.copyWith(notes: value));
  }

  Future save(BuildContext context) async {
    if (globalKey.currentState!.validate()) {
      if (state.addMode) {
        await customerRepository.insert(state.customer);
        state = state.copyWith(customer: const Customer());
        globalKey.currentState!.reset();
      } else {
        await customerRepository
            .update(state.customer)
            .then((_) => Navigator.pop(context, state.customer));
      }
    }
  }
}
