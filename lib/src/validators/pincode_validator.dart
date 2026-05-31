import '../../bharatvalidator.dart';

class PincodeValidator {
  final BharatMessages msg;
  const PincodeValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.pincodeRequired;
    if (!RegExp(r'^[1-9][0-9]{5}$').hasMatch(value.trim())) return msg.pincodeInvalid;
    return null;
  }
}