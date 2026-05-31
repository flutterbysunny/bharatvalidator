import '../../bharatvalidator.dart';

class PhoneValidator {
  final BharatMessages msg;
  const PhoneValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.phoneRequired;
    final clean = value.trim().replaceAll(RegExp(r'[\s\-\(\)]'), '');
    final stripped = clean.startsWith('+91') ? clean.substring(3)
        : clean.startsWith('91') && clean.length == 12 ? clean.substring(2)
        : clean;
    if (!RegExp(r'^[6-9][0-9]{9}$').hasMatch(stripped)) return msg.phoneInvalid;
    return null;
  }
}