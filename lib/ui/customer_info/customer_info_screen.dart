import 'package:customer_management/ui/customer_info/customer_info_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerInfoScreen extends HookConsumerWidget {
  const CustomerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerInfoProvider.notifier);
    final state = ref.watch(customerInfoProvider);

    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        actions: [_AppPopupMenu()],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                const Icon(Icons.account_circle, size: 144),
                const SizedBox(height: 8),
                Text(
                  state.nameKana,
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  state.name,
                  style: textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                // 注文一覧ボタン
                const SizedBox(height: 8),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('注文一覧'),
                        leading: const Icon(Icons.shopping_cart),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () {
                          viewModel.navigateOrderListUserScreen(context);
                        },
                      )
                    ],
                  ),
                ),
                // Instagramの情報
                const SizedBox(height: 8),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      ListTile(
                        title: const Text('Instagram'),
                        leading: Image.asset(
                          'assets/Instagram.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                      ListTile(
                        title: Text(state.accountName),
                        subtitle: const Text("アカウント名"),
                        leading: const Icon(null),
                      ),
                      ListTile(
                        title: Text('@${state.accountId}'),
                        subtitle: const Text("アカウントID"),
                        leading: const Icon(null),
                      ),
                    ],
                  ),
                ),
                // 住所
                const SizedBox(height: 8),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text('居住地情報'),
                        leading: Icon(Icons.place),
                      ),
                      ListTile(
                        title: Text(state.postCode),
                        subtitle: const Text("郵便番号"),
                        leading: const Icon(null),
                      ),
                      ListTile(
                        title: Text(state.address),
                        subtitle: const Text("住所"),
                        leading: const Icon(null),
                      ),
                    ],
                  ),
                ),
                // 備考
                const SizedBox(height: 8),
                Card(
                  clipBehavior: Clip.hardEdge,
                  child: Column(
                    children: [
                      const ListTile(
                        title: Text('備考'),
                        leading: Icon(Icons.description),
                      ),
                      ListTile(
                        title: Text(state.notes),
                        leading: const Icon(null),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppPopupMenu extends HookConsumerWidget {
  const _AppPopupMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(customerInfoProvider.notifier);
    final state = ref.watch(customerInfoProvider);

    return PopupMenuButton(
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: 0,
          child: Text("顧客の編集"),
        ),
        const PopupMenuItem(
          value: 1,
          child: Text("顧客の削除"),
        ),
      ],
      onSelected: (index) async {
        switch (index) {
          case 0:
            viewModel.navigateCustomerEditScreen(context);
            break;
          case 1:
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('顧客の削除'),
                content: Text('${state.name}さんの顧客情報を削除しますか？'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () async {
                      await viewModel.delete().then((isDeleted) {
                        if (isDeleted) {
                          // TODO:顧客一覧に戻る
                          Navigator.pop(context);
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('削除できませんでした'),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        }
                      });
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
            break;
        }
      },
    );
  }
}
