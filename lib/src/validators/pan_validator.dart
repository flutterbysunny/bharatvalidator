import '../../bharatvalidator.dart';

class PanValidator {
  final BharatMessages msg;
  const PanValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.panRequired;
    if (!RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$').hasMatch(value.trim().toUpperCase())) return msg.panInvalid;
    return null;
  }
}