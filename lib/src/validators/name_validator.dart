import '../../bharatvalidator.dart';

class NameValidator {
  final BharatMessages msg;
  const NameValidator(this.msg);
  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.nameRequired;
    if (!RegExp(r"^[a-zA-Z\u0900-\u097F\u0A80-\u0AFF\s.\-']{2,60}$").hasMatch(value.trim())) return msg.nameInvalid;
    return null;
  }
}