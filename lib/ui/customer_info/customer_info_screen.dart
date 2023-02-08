import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerInfoScreen extends HookConsumerWidget {
  const CustomerInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客の詳細'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => {},
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: const Text('顧客の削除'),
            )
          ],
        ),
      ),
    );
  }
}