import 'package:flutter_test/flutter_test.dart';
import 'package:bharatvalidator/bharatvalidator.dart';

void main() {
  late BharatValidator v;

  setUp(() => v = BharatValidator());

  // ── Aadhaar ──────────────────────────────────────────────────────────────
  group('Aadhaar', () {
    test('valid aadhaar', () => expect(v.aadhaar('234567890123'), isNull));
    test('valid with spaces', () => expect(v.aadhaar('2345 6789 0123'), isNull));
    test('empty', () => expect(v.aadhaar(''), isNotNull));
    test('starts with 0', () => expect(v.aadhaar('034567890123'), isNotNull));
    test('starts with 1', () => expect(v.aadhaar('134567890123'), isNotNull));
    test('too short', () => expect(v.aadhaar('23456789'), isNotNull));
    test('too long', () => expect(v.aadhaar('2345678901234'), isNotNull));
  });

  // ── PAN ──────────────────────────────────────────────────────────────────
  group('PAN', () {
    test('valid PAN', () => expect(v.pan('ABCDE1234F'), isNull));
    test('lowercase valid', () => expect(v.pan('abcde1234f'), isNull));
    test('empty', () => expect(v.pan(''), isNotNull));
    test('invalid format', () => expect(v.pan('AB1234567F'), isNotNull));
    test('too short', () => expect(v.pan('ABCDE123'), isNotNull));
  });

  // ── GST ──────────────────────────────────────────────────────────────────
  group('GST', () {
    test('valid GST', () => expect(v.gst('27AAPFU0939F1ZV'), isNull));
    test('empty', () => expect(v.gst(''), isNotNull));
    test('invalid', () => expect(v.gst('INVALIDGST'), isNotNull));
  });

  // ── IFSC ─────────────────────────────────────────────────────────────────
  group('IFSC', () {
    test('valid IFSC', () => expect(v.ifsc('SBIN0001234'), isNull));
    test('valid HDFC', () => expect(v.ifsc('HDFC0000001'), isNull));
    test('empty', () => expect(v.ifsc(''), isNotNull));
    test('too short', () => expect(v.ifsc('SBI001'), isNotNull));
    test('fifth char not 0', () => expect(v.ifsc('SBIN1001234'), isNotNull));
  });

  // ── UPI ──────────────────────────────────────────────────────────────────
  group('UPI', () {
    test('valid UPI', () => expect(v.upi('name@paytm'), isNull));
    test('valid mobile UPI', () => expect(v.upi('9876543210@upi'), isNull));
    test('empty', () => expect(v.upi(''), isNotNull));
    test('no @', () => expect(v.upi('nameonlyupi'), isNotNull));
  });

  // ── Pincode ──────────────────────────────────────────────────────────────
  group('Pincode', () {
    test('valid Ahmedabad pincode', () => expect(v.pincode('380001'), isNull));
    test('valid Mumbai pincode', () => expect(v.pincode('400001'), isNull));
    test('empty', () => expect(v.pincode(''), isNotNull));
    test('starts with 0', () => expect(v.pincode('012345'), isNotNull));
    test('too short', () => expect(v.pincode('38000'), isNotNull));
    test('too long', () => expect(v.pincode('3800011'), isNotNull));
  });

  // ── Phone ────────────────────────────────────────────────────────────────
  group('Phone', () {
    test('valid 10-digit', () => expect(v.phone('9876543210'), isNull));
    test('valid with +91', () => expect(v.phone('+919876543210'), isNull));
    test('valid with 91', () => expect(v.phone('919876543210'), isNull));
    test('empty', () => expect(v.phone(''), isNotNull));
    test('starts with 5', () => expect(v.phone('5876543210'), isNotNull));
    test('too short', () => expect(v.phone('987654321'), isNotNull));
  });

  // ── Email ────────────────────────────────────────────────────────────────
  group('Email', () {
    test('valid email', () => expect(v.email('test@example.com'), isNull));
    test('valid gmail', () => expect(v.email('user.name+tag@gmail.com'), isNull));
    test('empty', () => expect(v.email(''), isNotNull));
    test('no @', () => expect(v.email('invalidemail.com'), isNotNull));
    test('no domain', () => expect(v.email('test@'), isNotNull));
  });

  // ── Vehicle ──────────────────────────────────────────────────────────────
  group('Vehicle Number', () {
    test('valid GJ', () => expect(v.vehicle('GJ01AB1234'), isNull));
    test('valid MH', () => expect(v.vehicle('MH12DE1433'), isNull));
    test('with spaces', () => expect(v.vehicle('GJ 01 AB 1234'), isNull));
    test('empty', () => expect(v.vehicle(''), isNotNull));
    test('invalid format', () => expect(v.vehicle('ABCD1234'), isNotNull));
  });

  // ── Passport ─────────────────────────────────────────────────────────────
  group('Passport', () {
    test('valid passport', () => expect(v.passport('A1234567'), isNull));
    test('empty', () => expect(v.passport(''), isNotNull));
    test('invalid', () => expect(v.passport('12345678'), isNotNull));
  });

  // ── Voter ID ─────────────────────────────────────────────────────────────
  group('Voter ID', () {
    test('valid voter id', () => expect(v.voterId('ABC1234567'), isNull));
    test('empty', () => expect(v.voterId(''), isNotNull));
    test('too short', () => expect(v.voterId('AB123456'), isNotNull));
  });

  // ── Bank Account ─────────────────────────────────────────────────────────
  group('Bank Account', () {
    test('valid 11-digit', () => expect(v.bankAccount('12345678901'), isNull));
    test('valid 9-digit', () => expect(v.bankAccount('123456789'), isNull));
    test('valid 18-digit', () => expect(v.bankAccount('123456789012345678'), isNull));
    test('empty', () => expect(v.bankAccount(''), isNotNull));
    test('too short', () => expect(v.bankAccount('12345678'), isNotNull));
    test('has letters', () => expect(v.bankAccount('12345ABC90'), isNotNull));
  });

  // ── Password ─────────────────────────────────────────────────────────────
  group('Password', () {
    test('strong password', () => expect(v.password('Secure@123'), isNull));
    test('empty', () => expect(v.password(''), isNotNull));
    test('no uppercase', () => expect(v.password('secure@123'), isNotNull));
    test('no symbol', () => expect(v.password('Secure1234'), isNotNull));
    test('too short', () => expect(v.password('Se@1'), isNotNull));
  });

  // ── Multi-language ────────────────────────────────────────────────────────
  group('Multi-language errors', () {
    test('Hindi error for aadhaar', () {
      final hindi = BharatValidator(locale: BharatLocale.hindi);
      expect(hindi.aadhaar(''), contains('आधार'));
    });
    test('Gujarati error for pan', () {
      final guj = BharatValidator(locale: BharatLocale.gujarati);
      expect(guj.pan(''), contains('PAN'));
    });
    test('English error for phone', () {
      final eng = BharatValidator(locale: BharatLocale.english);
      expect(eng.phone(''), contains('Phone'));
    });
  });
}