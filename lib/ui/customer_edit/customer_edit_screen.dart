import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';


class CustomerEditScreen extends HookConsumerWidget {
  CustomerEditScreen({Key? key}) : super(key: key);

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerEditProvider.notifier);
    final state = ref.watch(customerEditProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.addMode ? '顧客の追加' : '顧客の編集'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
              key: globalKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
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
                    initialValue: state.customer.nameKana,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '氏名(ひらがな)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '氏名(ひらがな)を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setNameKana(value),
                  ),const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.customer.postCode,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '郵便番号',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // TODO 郵便番号用のバリデーション
                        return '郵便番号を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setPostCode(value),
                  ),const SizedBox(height: 20),
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
                  ),const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.customer.accountName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'アカウント名',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'アカウント名を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setAccountName(value),
                  ),const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.customer.accountId,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'アカウントID(英数字記号)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'アカウントIDを入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setAccountId(value),
                  ),const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.customer.notes,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '備考',
                    ),
                    onChanged: (value) => viewModel.setNotes(value),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {
                        if (globalKey.currentState!.validate()) {
                          viewModel.save(context);
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
