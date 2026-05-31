import '../locale/bharat_locale.dart';

/// Validates Indian EPF (Employee Provident Fund) account number.
/// Format: SS/RO-CODE/ESTABLISHMENT-CODE/EXTENSION/ACCOUNT-NUMBER
/// Example: MH/BAN/0012345/000/0001234
class EpfValidator {
  final BharatMessages msg;
  const EpfValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.epfRequired;
    final regex = RegExp(
        r'^[A-Z]{2}\/[A-Z]{3}\/[0-9]{7}\/[0-9]{3}\/[0-9]{7}$');
    if (!regex.hasMatch(value.trim().toUpperCase())) return msg.epfInvalid;
    return null;
  }
}
