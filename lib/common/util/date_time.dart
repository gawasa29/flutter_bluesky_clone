import 'package:intl/intl.dart';

bool sameDay(DateTime a, DateTime b) =>
    a.difference(b).inDays == 0 && a.day == b.day;

String humanReadableDateTimeString(
  DateTime? dateTime, [
  int daysDiffLimit = 30,
  String placeHolder = '',
]) {
  if (dateTime == null) {
    return placeHolder;
  }
  final now = DateTime.now();
  final diff = now.difference(dateTime);

  if (sameDay(dateTime, now)) {
    if (diff.inHours >= 1) {
      return '${diff.inHours}h';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes}m';
    } else {
      return '${diff.inSeconds}s';
    }
  }

  final todaysMidnight = DateTime(now.year, now.month, now.day);
  final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final daysDiff = todaysMidnight.difference(midnight).inDays.abs();

  if (daysDiff <= daysDiffLimit) {
    if (daysDiff <= 1) {
      return '${daysDiff}d';
    } else if (daysDiff <= 30) {
      return '$daysDiff d';
    } else {
      final monthsDiff = (daysDiff / 30).floor();
      return '$monthsDiff mo';
    }
  }

  return DateFormat('yyyy-MM-dd').format(dateTime);
}
