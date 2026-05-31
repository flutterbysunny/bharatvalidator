import '../locale/bharat_locale.dart';

/// Validates username.
/// Rules: 3–20 chars, letters/digits/underscore/hyphen, no spaces.
class UsernameValidator {
  final BharatMessages msg;
  const UsernameValidator(this.msg);

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.usernameRequired;
    final regex = RegExp(r'^[a-zA-Z0-9_\-]{3,20}$');
    if (!regex.hasMatch(value.trim())) return msg.usernameInvalid;
    return null;
  }
}
