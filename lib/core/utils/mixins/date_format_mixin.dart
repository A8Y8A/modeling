import 'package:intl/intl.dart';

mixin DateFormatMixin {
  String formatDate(DateTime date) {
    return DateFormat('d-MMM, yyyy').format(date);
  }
}
