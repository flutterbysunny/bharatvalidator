import '../locale/bharat_locale.dart';

/// Validates Indian Company Identification Number (CIN).
/// Format: U/L + 5 digits + 2 letters + 4 digits + PTC/PLC/etc + 6 digits
/// Example: U67190TN2014PTC096978
class CinValidator {
  final BharatMessages msg;
  const CinValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.cinRequired;
    final regex = RegExp(
        r'^[UL][0-9]{5}[A-Z]{2}[0-9]{4}[A-Z]{3}[0-9]{6}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) return msg.cinInvalid;
    return null;
  }
}
