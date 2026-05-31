import '../../bharatvalidator.dart';

class GstValidator {
  final BharatMessages msg;
  const GstValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.gstRequired;
    if (!RegExp(r'^[0-3]{1}[0-9]{1}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$').hasMatch(value.trim().toUpperCase())) return msg.gstInvalid;
    return null;
  }
}