import '../locale/bharat_locale.dart';

/// Validates credit/debit card number using Luhn algorithm.
/// Works for Visa, Mastercard, RuPay, Amex, etc.
class CardNumberValidator {
  final BharatMessages msg;
  const CardNumberValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.cardRequired;
    final clean = value.replaceAll(RegExp(r'[\s\-]'), '');
    if (!RegExp(r'^\d{13,19}$').hasMatch(clean)) return msg.cardInvalid;
    if (!_luhn(clean)) return msg.cardInvalid;
    return null;
  }

  /// Luhn algorithm check
  bool _luhn(String number) {
    int sum = 0;
    bool alternate = false;
    for (int i = number.length - 1; i >= 0; i--) {
      int n = int.parse(number[i]);
      if (alternate) {
        n *= 2;
        if (n > 9) n -= 9;
      }
      sum += n;
      alternate = !alternate;
    }
    return sum % 10 == 0;
  }
}
