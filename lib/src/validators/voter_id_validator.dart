import '../../bharatvalidator.dart';

class VoterIdValidator {
  final BharatMessages msg;
  const VoterIdValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.voterIdRequired;
    if (!RegExp(r'^[A-Z]{3}[0-9]{7}$').hasMatch(value.trim().toUpperCase())) return msg.voterIdInvalid;
    return null;
  }
}