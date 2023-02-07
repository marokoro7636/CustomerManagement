import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_add/customer_add_viewmodel.dart';

class CustomerAddScreen extends HookConsumerWidget {
  const CustomerAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final globalKey = ref.watch(formKeyProvider);
    final notifier = ref.watch(customerInfoStateProvider.notifier);

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
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '住所',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          notifier.addCustomer();
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