import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:customer_management/ui/customer_add/customer_add_screen.dart';

class CustomerListScreen extends HookConsumerWidget {
  const CustomerListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('顧客一覧'),
      ),
      body: const Center(
        child: Text('顧客一覧画面'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) {
              return const CustomerAddScreen();
            } ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}