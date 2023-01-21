import 'package:date_format/date_format.dart';

mixin DateFormatter {
  String format(DateTime? date) {
    if (date == null) return 'date not found';
    // date is today
    if (formatDate(date, [dd, mm, yyyy]) ==
        formatDate(DateTime.now(), [dd, mm, yyyy])) {
      return 'Today at ${formatDate(date, [HH, ':', nn])}';
    }

    return formatDate(date, [dd, '/', mm, ' ', HH, ':', nn]);
  }
}
