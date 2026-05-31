import '../locale/bharat_locale.dart';

/// Validates Indian Driving License number.
/// Format: SS-RR-YYYY-NNNNNNN (e.g. GJ01-2020-0123456)
class DrivingLicenseValidator {
  final BharatMessages msg;
  const DrivingLicenseValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.drivingLicenseRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-]'), '').toUpperCase();
    final regex = RegExp(r'^[A-Z]{2}[0-9]{2}[0-9]{4}[0-9]{7}$');
    if (!regex.hasMatch(clean)) return msg.drivingLicenseInvalid;
    return null;
  }
}
