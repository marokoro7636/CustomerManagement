import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/route.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/model/repository/customer_repository.dart';

final customerEditProvider =
    StateNotifierProvider<CustomerEditViewModel, CustomerEditState>(
        (ref) => throw UnimplementedError());

class CustomerEditViewModel extends StateNotifier<CustomerEditState> {
  CustomerEditViewModel({
    required CustomerEditState customerEditState,
    required this.customerRepository,
  }) : super(customerEditState);

  final CustomerRepository customerRepository;

  var containerKey = UniqueKey();
  final formKey = GlobalKey<FormState>();

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
    if (value != null && value.isNotEmpty && value.length != 7) {
      return '郵便番号は7桁です';
    }
    return null;
  }

  void setAddress(String value) {
    state = state.copyWith(customer: state.customer.copyWith(address: value));
  }

  void setAccountName(String value) {
    state =
        state.copyWith(customer: state.customer.copyWith(accountName: value));
  }

  void setAccountId(String value) {
    state = state.copyWith(customer: state.customer.copyWith(accountId: value));
  }

  void setNotes(String value) {
    state = state.copyWith(customer: state.customer.copyWith(notes: value));
  }

  Future<bool> save(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      if (state.addMode) {
        await customerRepository.insert(state.customer).then((value) {
          Get.back();
          Get.toNamed('$customerAddPath/nt');
        });
      } else {
        await customerRepository.update(state.customer);
        Get.back(result: state.customer);
      }
      return true;
    }
    return false;
  }
}
