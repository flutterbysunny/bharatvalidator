import '../locale/bharat_locale.dart';

/// Validates URL (http/https).
class UrlValidator {
  final BharatMessages msg;
  const UrlValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.urlRequired;
    final regex = RegExp(
        r'^(https?:\/\/)([a-zA-Z0-9\-]+\.)+[a-zA-Z]{2,}(\/[^\s]*)?$');
    if (!regex.hasMatch(value.trim())) return msg.urlInvalid;
    return null;
  }
}
