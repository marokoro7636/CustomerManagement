import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toFormattedString() {
    final formatter = DateFormat('yyyy/MM/dd');
    return formatter.format(this);
  }
}