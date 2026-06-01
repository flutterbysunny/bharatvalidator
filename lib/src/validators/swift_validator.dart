import '../locale/bharat_locale.dart';

/// Validates SWIFT / BIC code for international bank transfers.
/// Format: 8 or 11 characters
/// AAAA BB CC DDD
/// - AAAA: Bank code (4 letters)
/// - BB:   Country code (2 letters)
/// - CC:   Location code (2 alphanumeric)
/// - DDD:  Branch code (3 alphanumeric, optional)
/// Example: SBININBB or SBININBB123
class SwiftValidator {
  final BharatMessages msg;
  const SwiftValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.swiftRequired;
    final clean = value.trim().toUpperCase().replaceAll(RegExp(r'\s+'), '');
    final regex = RegExp(r'^[A-Z]{4}[A-Z]{2}[A-Z0-9]{2}([A-Z0-9]{3})?$');
    if (!regex.hasMatch(clean)) return msg.swiftInvalid;
    return null;
  }
}