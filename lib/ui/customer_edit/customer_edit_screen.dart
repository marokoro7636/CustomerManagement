import 'package:customer_management/model/entity/customer.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';

class CustomerEditScreen extends HookConsumerWidget {
  const CustomerEditScreen({Key? key, this.customer}) : super(key: key);

  final Customer? customer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = GlobalKey<FormState>();
    final viewModel = ref.watch(customerEditProvider(CustomerEditState(
            customer: customer ?? const Customer(),
            addMode: customer == null ? true : false))
        .notifier);
    final state = ref.watch(customerEditProvider(CustomerEditState(
        customer: customer ?? const Customer(),
        addMode: customer == null ? true : false)));

    return Scaffold(
      appBar: AppBar(
        title: Text(customer == null ? '顧客の追加' : '顧客の編集'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
              key: globalKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  // TODO キーボードがすぐ閉じる
                  TextFormField(
                    initialValue: state.customer.name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '氏名',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '氏名を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setName(value),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.customer.address,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '住所',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '住所を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setAddress(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          viewModel.save();
                          // TODO 保存ダイアログを出す
                        }
                      },
                      child: const Text('保存'))
                ],
              )),
        ),
      ),
    );
  }
}
