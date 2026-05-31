import '../../bharatvalidator.dart';

class AadhaarValidator {
  final BharatMessages msg;
  const AadhaarValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.aadhaarRequired;
    final clean = value.replaceAll(RegExp(r'\s+'), '');
    final regex = RegExp(r'^[2-9]{1}[0-9]{11}$');
    if (!regex.hasMatch(clean)) return msg.aadhaarInvalid;
    return null;
  }
}