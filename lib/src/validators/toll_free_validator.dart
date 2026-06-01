import '../locale/bharat_locale.dart';

/// Validates Indian toll-free numbers.
/// Valid prefixes: 1800, 1860, 1900
/// Total length: 10–13 digits
/// Examples: 18001234567 / 1800-123-4567 / 1860-123-4567
class TollFreeValidator {
  final BharatMessages msg;
  const TollFreeValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.tollFreeRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-]'), '');
    final regex = RegExp(r'^(1800|1860|1900)[0-9]{6,9}$');
    if (!regex.hasMatch(clean)) return msg.tollFreeInvalid;
    return null;
  }
}