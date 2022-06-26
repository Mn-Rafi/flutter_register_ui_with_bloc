import 'package:intl/intl.dart';

String dateFormat(DateTime dateTime) {
  final formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);
  return formattedDate;
}
