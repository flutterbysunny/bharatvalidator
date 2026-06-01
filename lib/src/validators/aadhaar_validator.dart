import '../locale/bharat_locale.dart';

/// Validates Indian Aadhaar number.
/// Deep validation using Verhoeff checksum algorithm (same as UIDAI).
class AadhaarValidator {
  final BharatMessages msg;
  const AadhaarValidator(this.msg);

  static const _d = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 2, 3, 4, 0, 6, 7, 8, 9, 5],
    [2, 3, 4, 0, 1, 7, 8, 9, 5, 6],
    [3, 4, 0, 1, 2, 8, 9, 5, 6, 7],
    [4, 0, 1, 2, 3, 9, 5, 6, 7, 8],
    [5, 9, 8, 7, 6, 0, 4, 3, 2, 1],
    [6, 5, 9, 8, 7, 1, 0, 4, 3, 2],
    [7, 6, 5, 9, 8, 2, 1, 0, 4, 3],
    [8, 7, 6, 5, 9, 3, 2, 1, 0, 4],
    [9, 8, 7, 6, 5, 4, 3, 2, 1, 0],
  ];

  static const _p = [
    [0, 1, 2, 3, 4, 5, 6, 7, 8, 9],
    [1, 5, 7, 6, 2, 8, 3, 0, 9, 4],
    [5, 8, 0, 3, 7, 9, 6, 1, 4, 2],
    [8, 9, 1, 6, 0, 4, 3, 5, 2, 7],
    [9, 4, 5, 3, 1, 2, 6, 8, 7, 0],
    [4, 2, 8, 6, 5, 7, 3, 9, 0, 1],
    [2, 7, 9, 3, 8, 0, 6, 4, 1, 5],
    [7, 0, 4, 6, 9, 1, 3, 2, 5, 8],
  ];

  // ✅ FIX: _inv removed — only needed for check digit generation, not validation

  bool _verhoeff(String number) {
    int c = 0;
    final reversed = number.split('').reversed.toList();
    for (int i = 0; i < reversed.length; i++) {
      final digit = int.parse(reversed[i]);
      c = _d[c][_p[i % 8][digit]];
    }
    return c == 0;
  }

  String? validate(String? value) {
    if (value == null || value.trim().isEmpty) return msg.aadhaarRequired;
    final clean = value.replaceAll(RegExp(r'\s+'), '');
    if (!RegExp(r'^[2-9]{1}[0-9]{11}$').hasMatch(clean)) return msg.aadhaarInvalid;
    if (!_verhoeff(clean)) return msg.aadhaarInvalid;
    return null;
  }
}