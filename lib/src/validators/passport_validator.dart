import '../../bharatvalidator.dart';

class PassportValidator {
  final BharatMessages msg;
  const PassportValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.passportRequired;
    if (!RegExp(r'^[A-PR-WYa-pr-wy][1-9]\d\s?\d{4}[1-9]$').hasMatch(value.trim().toUpperCase())) return msg.passportInvalid;
    return null;
  }
}