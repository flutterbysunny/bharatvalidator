import '../locale/bharat_locale.dart';

/// Validates OTP — 4 or 6 digit numeric code.
class OtpValidator {
  final BharatMessages msg;
  final int length;

  /// [length] can be 4 or 6. Defaults to 6.
  const OtpValidator(this.msg, {this.length = 6});

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.otpRequired;
    final regex = RegExp('^[0-9]{$length}\$');
    if (!regex.hasMatch(value.trim())) return msg.otpInvalid(length);
    return null;
  }
}
