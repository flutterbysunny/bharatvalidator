import '../../bharatvalidator.dart';

class PasswordValidator {
  final BharatMessages msg;
  const PasswordValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.isEmpty) return msg.passwordRequired;
    if (!RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&^#])[A-Za-z\d@$!%*?&^#]{8,}$').hasMatch(value)) return msg.passwordWeak;
    return null;
  }
}