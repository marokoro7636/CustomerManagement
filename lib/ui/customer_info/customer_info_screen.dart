import 'package:customer_management/ui/customer_edit/customer_edit_state.dart';
import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
import 'package:customer_management/ui/order_user/order_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerInfoScreen extends HookConsumerWidget {
  const CustomerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerInfoProvider.notifier);
    final state = ref.watch(customerInfoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の詳細'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('氏名 : ${state.name}'),
            const SizedBox(height: 20),
            Text('住所 : ${state.address}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const OrderUserScreen();
                }));
              },
              child: const Text('注文一覧'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                viewModel.navigateCustomerEditScreen(context,
                    CustomerEditState(customer: state, addMode: false));
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('顧客の編集'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await viewModel
                    .delete()
                    .then((value) => Navigator.pop(context));
                // TODO 削除ダイアログを出す
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              child: const Text('顧客の削除'),
            )
          ],
        ),
      ),
    );
  }
}
