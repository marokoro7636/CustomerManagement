import 'package:customer_management/model/db/app_database.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AnnualSalesScreen extends HookConsumerWidget {
  const AnnualSalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('年間売上'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('テスト'),
              onPressed: () async {
                final db = AppDatabase();
                print(await db.groupOrderByName(2022));
                print(await db.groupOrderByName(2023));
              },
            ),
          ],
        ),
      )
    );
  }
}