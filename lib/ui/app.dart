import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'base/base_screen.dart';

final routeObserver = RouteObserver();

class CustomerManagementApp extends HookConsumerWidget {
  const CustomerManagementApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'CustomerManagement',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BaseScreen(),
      navigatorObservers: [routeObserver],
    );
  }
}
