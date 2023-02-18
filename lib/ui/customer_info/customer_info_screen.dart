import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
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
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text('氏名 : ${state.name}'),
            const SizedBox(height: 20),
            Text('氏名(ひらがな) : ${state.nameKana}'),
            const SizedBox(height: 20),
            Text('郵便番号 : ${state.postCode}'),
            const SizedBox(height: 20),
            Text('住所 : ${state.address}'),
            const SizedBox(height: 20),
            Text('アカウント名 : ${state.accountName}'),
            const SizedBox(height: 20),
            Text('アカウントID : @${state.accountId}'),
            const SizedBox(height: 20),
            Text('備考 : ${state.notes}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.navigateOrderListUserScreen(context),
              child: const Text('注文一覧'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => viewModel.navigateCustomerEditScreen(context),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: const Text('顧客の編集'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await viewModel.delete().then((isDeleted) {
                  if (isDeleted) {
                    Navigator.pop(context);
                  } else {
                    // TODO 顧客が削除できなかったときの処理を書く
                    print('cant delete');
                  }
                });
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
