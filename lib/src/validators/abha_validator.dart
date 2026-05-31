import '../locale/bharat_locale.dart';

/// Validates ABHA (Ayushman Bharat Health Account) / Health ID.
/// Format: 14 digits (XX-XXXX-XXXX-XXXX) or health ID like name@abdm
class AbhaValidator {
  final BharatMessages msg;
  const AbhaValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.abhaRequired;
    final clean = value.trim().replaceAll('-', '');
    // 14-digit ABHA number
    if (RegExp(r'^\d{14}$').hasMatch(clean)) return null;
    // ABHA address (name@abdm)
    if (RegExp(r'^[a-zA-Z0-9.\-_]{3,}@[a-zA-Z]+$').hasMatch(value.trim())) return null;
    return msg.abhaInvalid;
  }
}
