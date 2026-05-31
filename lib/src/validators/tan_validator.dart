import '../locale/bharat_locale.dart';

/// Validates Indian TAN (Tax Deduction and Collection Account Number).
/// Format: 4 letters + 5 digits + 1 letter (e.g. PDES03028F)
class TanValidator {
  final BharatMessages msg;
  const TanValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.tanRequired;
    final regex = RegExp(r'^[A-Z]{4}[0-9]{5}[A-Z]{1}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) return msg.tanInvalid;
    return null;
  }
}
