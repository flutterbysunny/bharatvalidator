import '../locale/bharat_locale.dart';

/// Validates Indian landline number.
/// Format: STD code (2-4 digits) + number = 10 digits total
/// Example: 02212345678 or 044-23456789
class LandlineValidator {
  final BharatMessages msg;
  const LandlineValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.landlineRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-]'), '');
    final regex = RegExp(r'^0[0-9]{9,10}$');
    if (!regex.hasMatch(clean)) return msg.landlineInvalid;
    return null;
  }
}
