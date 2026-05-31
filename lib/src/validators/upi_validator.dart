import '../../bharatvalidator.dart';

class UpiValidator {
  final BharatMessages msg;
  const UpiValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.upiRequired;
    if (!RegExp(r'^[a-zA-Z0-9.\-_]{2,256}@[a-zA-Z]{2,64}$').hasMatch(value.trim())) return msg.upiInvalid;
    return null;
  }
}