const _months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];

/// "Sep 14"
String shortDate(DateTime d) => '${_months[d.month - 1]} ${d.day}';

/// "2 Sep 2026"
String longDate(DateTime d) => '${d.day} ${_months[d.month - 1]} ${d.year}';

/// "Sep 9 · 10:14"
String shortDateTime(DateTime d) {
  final hh = d.hour.toString().padLeft(2, '0');
  final mm = d.minute.toString().padLeft(2, '0');
  return '${shortDate(d)} · $hh:$mm';
}

/// "1 page", "2 pages"
String plural(int n, String one, [String? many]) => '$n ${n == 1 ? one : (many ?? '${one}s')}';
