import '../locale/bharat_locale.dart';

/// Validates Indian Ration Card number.
/// Format varies by state but generally:
/// - 2 letter state code + 10–14 alphanumeric digits
/// Example: GJ123456789012 / MH-1234-5678-9012
class RationCardValidator {
  final BharatMessages msg;
  const RationCardValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.rationCardRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-]'), '').toUpperCase();
    // State code (2 letters) + 10 to 14 digits/alphanumeric
    final regex = RegExp(r'^[A-Z]{2}[A-Z0-9]{10,14}$');
    if (!regex.hasMatch(clean)) return msg.rationCardInvalid;
    return null;
  }
}