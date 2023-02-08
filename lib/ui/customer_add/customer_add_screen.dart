import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_add/customer_add_viewmodel.dart';

class CustomerAddScreen extends HookConsumerWidget {
  const CustomerAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = ref.watch(formKeyProvider);
    final viewModel = ref.watch(customerEditProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の追加'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
              key: globalKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
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
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          await viewModel.save();
                        }
                      },
                      child: const Text('保存')
                  )
                ],
              )),
        ),
      ),
    );
  }
}