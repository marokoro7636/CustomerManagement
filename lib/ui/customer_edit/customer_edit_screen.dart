import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_edit/customer_edit_viewmodel.dart';

class CustomerEditScreen extends HookConsumerWidget {
  const CustomerEditScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerEditProvider.notifier);
    final state = ref.watch(customerEditProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.addMode ? '顧客の追加' : '顧客の編集'),
      ),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Container(
            key: viewModel.containerKey,
            padding: const EdgeInsets.all(30),
            child: Form(
                key: viewModel.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.name,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '氏名',
                      ),
                      validator: viewModel.validateName,
                      onChanged: viewModel.setName,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.nameKana,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '氏名(ひらがな)',
                      ),
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) =>
                            RegExp(r'^[ぁ-ん]*$').hasMatch(newValue.text)
                                ? newValue
                                : oldValue),
                      ],
                      validator: viewModel.validateNameKana,
                      onChanged: viewModel.setNameKana,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.postCode,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '郵便番号',
                        counterText: '',
                      ),
                      maxLength: 7,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      validator: viewModel.validatePostCode,
                      onChanged: viewModel.setPostCode,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.address,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '住所',
                      ),
                      validator: viewModel.validateAddress,
                      onChanged: viewModel.setAddress,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.accountName,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'アカウント名',
                      ),
                      validator: viewModel.validateAccountName,
                      onChanged: viewModel.setAccountName,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.accountId,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'アカウントID(英数字記号)',
                      ),
                      inputFormatters: [
                        TextInputFormatter.withFunction((oldValue, newValue) =>
                            RegExp(r'^\p{ASCII}*$', unicode: true)
                                    .hasMatch(newValue.text)
                                ? newValue
                                : oldValue),
                      ],
                      validator: viewModel.validateAccountId,
                      onChanged: viewModel.setAccountId,
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      initialValue: state.customer.notes,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '備考',
                      ),
                      onChanged: viewModel.setNotes,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      onPressed: () async {
                        await viewModel.save(context).then((result) {
                          if (result) {
                            Get.rawSnackbar(message: '保存しました');
                          }
                        });
                      },
                      child: const Text('保存'),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
