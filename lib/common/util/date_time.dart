import 'package:intl/intl.dart';

/// 2 つの DateTime が同じ日かどうか判定する
bool sameDay(DateTime a, DateTime b) =>
    a.difference(b).inDays == 0 && a.day == b.day;

/// - 今日と同じ日付なら何時間前を表示
/// - N 日前までなら「N 日前」の文字列を
/// - それより前なら yyyy-MM-dd の日付を
///
/// 返す

String humanReadableDateTimeString(
  DateTime? dateTime, [
  int daysDiffLimit = 7,
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
  // 今日の 00:00
  final todaysMidnight = DateTime(now.year, now.month, now.day);
  // 引数に渡した日の 00:00
  final midnight = DateTime(dateTime.year, dateTime.month, dateTime.day);

  // 今日の 00:00 と引数に渡した日の 00:00 の日付差を取って
  // 「今日」「昨日」or「N 日前」の文字列を返す
  final daysDiff = todaysMidnight.difference(midnight).inDays.abs();
  if (daysDiff <= daysDiffLimit) {
    if (daysDiff == 0) {
      return 'today';
    }
    if (daysDiff == 1) {
      return '1d';
    }
    return '$daysDiff d';
  }
  // 上記に該当しない場合は yyyy-MM-dd の日付を返す
  return DateFormat('yyyy-MM-dd').format(dateTime);
}
