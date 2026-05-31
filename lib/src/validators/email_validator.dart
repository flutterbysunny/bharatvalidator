import '../../bharatvalidator.dart';

class EmailValidator {
  final BharatMessages msg;
  const EmailValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.emailRequired;
    if (!RegExp(r'^[\w\.\+\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z]{2,}$').hasMatch(value.trim())) return msg.emailInvalid;
    return null;
  }
}