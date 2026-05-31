import '../locale/bharat_locale.dart';

/// Validates Udyam Registration Number (MSME).
/// Format: UDYAM-XX-00-0000000
/// Example: UDYAM-MH-01-0012345
class UdyamValidator {
  final BharatMessages msg;
  const UdyamValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.udyamRequired;
    final regex = RegExp(r'^UDYAM-[A-Z]{2}-[0-9]{2}-[0-9]{7}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) return msg.udyamInvalid;
    return null;
  }
}
