import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final formKeyProvider = Provider((ref) => GlobalKey<FormState>());
final customerInfoStateProvider =
    StateNotifierProvider<CustomerInfoViewModel, CustomerInfoState>(
            (ref) => CustomerInfoViewModel());

@immutable
class CustomerInfoState {
  const CustomerInfoState({required this.name, required this.address});

  final String name;
  final String address;

  CustomerInfoState copy({String? name, String? address}) {
    return CustomerInfoState(
        name: name ?? this.name,
        address: address ?? this.address
    );
  }
}

class CustomerInfoViewModel extends StateNotifier<CustomerInfoState> {
  CustomerInfoViewModel() : super(const CustomerInfoState(name: '', address: ''));

  void addCustomer() {
    print('OK');
  }

}