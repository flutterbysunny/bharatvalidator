import '../../bharatvalidator.dart';

class IfscValidator {
  final BharatMessages msg;
  const IfscValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.ifscRequired;
    if (!RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value.trim().toUpperCase())) return msg.ifscInvalid;
    return null;
  }
}