import 'package:customer_management/ui/order_edit/order_edit_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderEditScreen extends HookConsumerWidget {
  const OrderEditScreen({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.order.goodsName,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '商品名',
                    ),
                    validator: viewModel.validateGoodsName,
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
                      counterText: '',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => viewModel.setGoodsPrice(value),
                    maxLength: 6,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    initialValue: state.order.goodsAmount == 0
                        ? ''
                        : state.order.goodsAmount.toString(),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '数量',
                      counterText: '',
                    ),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) => viewModel.setGoodsAmount(value),
                    maxLength: 4,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    controller: viewModel.orderDateController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '注文日',
                      prefixIcon: IconButton(
                        onPressed: () => viewModel.setOrderDate(context),
                        icon: const Icon(Icons.calendar_today),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => viewModel.deleteOrderDate(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    onTap: () => viewModel.setOrderDate(context),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    readOnly: true,
                    controller: viewModel.sendDateController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: '発送日',
                      prefixIcon: IconButton(
                        onPressed: () => viewModel.setSendDate(context),
                        icon: const Icon(Icons.calendar_today),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => viewModel.deleteSendDate(),
                        icon: const Icon(Icons.close),
                      ),
                    ),
                    validator: viewModel.validateSendDate,
                    onTap: () => viewModel.setSendDate(context),
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
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
