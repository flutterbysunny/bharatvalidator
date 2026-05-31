import '../locale/bharat_locale.dart';

/// Validates RERA (Real Estate Regulatory Authority) registration number.
/// Format varies by state but generally alphanumeric, 10-20 chars.
/// Example: UPRERAPRJ123456 / MahaRERA/P51900012345
class ReraValidator {
  final BharatMessages msg;
  const ReraValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.reraRequired;
    final clean = value.trim();
    if (clean.length < 8 || clean.length > 30) return msg.reraInvalid;
    final regex = RegExp(r'^[A-Za-z0-9\/\-\_]{8,30}$');
    if (!regex.hasMatch(clean)) return msg.reraInvalid;
    return null;
  }
}
