import '../locale/bharat_locale.dart';

/// Validates Date of Birth.
/// Accepts: DD/MM/YYYY or DD-MM-YYYY or YYYY-MM-DD
/// Optional: min/max age check
class DobValidator {
  final BharatMessages msg;
  final int? minAge;
  final int? maxAge;

  const DobValidator(this.msg, {this.minAge, this.maxAge});

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.dobRequired;

    DateTime? date;
    try {
      final parts = value.trim().split(RegExp(r'[/\-]'));
      if (parts.length != 3) return msg.dobInvalid;

      int day, month, year;
      // Detect YYYY-MM-DD vs DD/MM/YYYY
      if (parts[0].length == 4) {
        year = int.parse(parts[0]);
        month = int.parse(parts[1]);
        day = int.parse(parts[2]);
      } else {
        day = int.parse(parts[0]);
        month = int.parse(parts[1]);
        year = int.parse(parts[2]);
      }
      date = DateTime(year, month, day);
      if (date.day != day || date.month != month || date.year != year) {
        return msg.dobInvalid;
      }
    } catch (_) {
      return msg.dobInvalid;
    }

    final now = DateTime.now();
    if (date.isAfter(now)) return msg.dobFuture;

    if (minAge != null || maxAge != null) {
      final age = _age(date, now);
      if (minAge != null && age < minAge!) return msg.dobMinAge(minAge!);
      if (maxAge != null && age > maxAge!) return msg.dobMaxAge(maxAge!);
    }

    return null;
  }

  int _age(DateTime dob, DateTime now) {
    int age = now.year - dob.year;
    if (now.month < dob.month ||
        (now.month == dob.month && now.day < dob.day)) age--;
    return age;
  }
}
