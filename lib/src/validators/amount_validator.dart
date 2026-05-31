import '../locale/bharat_locale.dart';

/// Validates Indian currency amount.
/// Accepts: 1000 / 1,000 / 1,00,000 / 1000.50 / ₹1000
class AmountValidator {
  final BharatMessages msg;
  final double? min;
  final double? max;

  const AmountValidator(this.msg, {this.min, this.max});

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.amountRequired;

    // Strip ₹ symbol and commas
    final clean = value.trim()
        .replaceAll('₹', '')
        .replaceAll(',', '')
        .trim();

    final amount = double.tryParse(clean);
    if (amount == null || amount < 0) return msg.amountInvalid;

    if (min != null && amount < min!) return msg.amountMin(min!);
    if (max != null && amount > max!) return msg.amountMax(max!);

    return null;
  }
}
