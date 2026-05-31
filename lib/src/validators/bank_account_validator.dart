import '../../bharatvalidator.dart';

class BankAccountValidator {
  final BharatMessages msg;
  const BankAccountValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.bankAccountRequired;
    if (!RegExp(r'^\d{9,18}$').hasMatch(value.trim())) return msg.bankAccountInvalid;
    return null;
  }
}