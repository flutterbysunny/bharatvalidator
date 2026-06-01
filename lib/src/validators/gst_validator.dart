import '../locale/bharat_locale.dart';

/// Validates Indian GST number with deep checksum verification.
class GstValidator {
  final BharatMessages msg;
  const GstValidator(this.msg);

  static const _gstChars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';

  bool _verifyChecksum(String gst) {
    int factor = 2;
    int sum = 0;
    // ✅ FIX: final → const (compile-time constant value)
    const charsetLen = 36;

    for (int i = gst.length - 2; i >= 0; i--) {
      int codePoint = _gstChars.indexOf(gst[i]);
      int digit = factor * codePoint;
      factor = (factor == 2) ? 1 : 2;
      digit = (digit ~/ charsetLen) + (digit % charsetLen);
      sum += digit;
    }

    final checkIndex = (charsetLen - (sum % charsetLen)) % charsetLen;
    return _gstChars[checkIndex] == gst[gst.length - 1];
  }

  static const _validStateCodes = {
    '01','02','03','04','05','06','07','08','09','10',
    '11','12','13','14','15','16','17','18','19','20',
    '21','22','23','24','25','26','27','28','29','30',
    '31','32','33','34','35','36','37','97','99',
  };

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.gstRequired;
    final clean = value.trim().toUpperCase();
    if (!RegExp(r'^[0-3][0-9][A-Z]{5}[0-9]{4}[A-Z][1-9A-Z]Z[0-9A-Z]$').hasMatch(clean)) {
      return msg.gstInvalid;
    }
    final stateCode = clean.substring(0, 2);
    if (!_validStateCodes.contains(stateCode)) return msg.gstInvalid;
    if (!_verifyChecksum(clean)) return msg.gstInvalid;
    return null;
  }
}