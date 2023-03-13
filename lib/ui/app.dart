import 'package:customer_management/ui/route.dart';
import 'package:customer_management/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomerManagementApp extends HookConsumerWidget {
  const CustomerManagementApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GetMaterialApp(
      title: 'CustomerManagement',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: customerListPath,
      getPages: ref.watch(getPagesProvider),
      routingCallback: ref.watch(routingCallbackProvider),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      supportedLocales: const [
        Locale('en'),
        Locale('ja'),
      ],
    );
  }
}
