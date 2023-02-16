import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderEditScreen extends HookConsumerWidget {
  OrderEditScreen({Key? key}) : super(key: key);

  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(orderEditProvider);
    final viewModel = ref.watch(orderEditProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.addMode
            ? '${state.customer.name}さんの注文の追加'
            : '${state.customer.name}さんの注文の編集'),
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
                    initialValue: state.order.goodsName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '商品名',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '商品名を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setGoodsName(value),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.order.goodsPrice == 0
                        ? ''
                        : state.order.goodsPrice.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '単価',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '単価を入力してください';
                      }
                      return null;
                    },
                    onChanged: (value) => viewModel.setGoodsPrice(value),
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
