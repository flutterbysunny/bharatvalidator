import '../locale/bharat_locale.dart';

/// Validates Indian MICR (Magnetic Ink Character Recognition) code.
/// Format: 9 digits (city 3 + bank 3 + branch 3)
class MicrValidator {
  final BharatMessages msg;
  const MicrValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.micrRequired;
    final regex = RegExp(r'^[0-9]{9}$');
    if (!regex.hasMatch(value.trim())) return msg.micrInvalid;
    return null;
  }
}
