import '../locale/bharat_locale.dart';

/// Validates FSSAI (Food Safety and Standards Authority of India) license number.
/// Format: 14 digits
class FssaiValidator {
  final BharatMessages msg;
  const FssaiValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.fssaiRequired;
    final regex = RegExp(r'^[0-9]{14}$');
    if (!regex.hasMatch(value.trim())) return msg.fssaiInvalid;
    return null;
  }
}
