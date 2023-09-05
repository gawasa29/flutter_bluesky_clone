String? parseError(Exception error) {
  final regExp = RegExp(r'message: ([^\)]+)');
  final match = regExp.firstMatch(error.toString());

  if (match == null) return null;

  return match.group(1);
}
