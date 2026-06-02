import 'package:flutter_test/flutter_test.dart';
import 'package:bharatvalidator/bharatvalidator.dart';

void main() {
  late BharatValidator v;
  setUp(() => v = BharatValidator());

  // ── Aadhaar ──────────────────────────────────────────────────────────────
  group('Aadhaar', () {
    test('valid aadhaar',     () => expect(v.aadhaar('234567890123'), isNull));
    test('valid with spaces', () => expect(v.aadhaar('2345 6789 0123'), isNull));
    test('empty',             () => expect(v.aadhaar(''), isNotNull));
    test('starts with 0',     () => expect(v.aadhaar('034567890123'), isNotNull));
    test('starts with 1',     () => expect(v.aadhaar('134567890123'), isNotNull));
    test('too short',         () => expect(v.aadhaar('23456789'), isNotNull));
    test('too long',          () => expect(v.aadhaar('2345678901234'), isNotNull));

    // Deep Verhoeff — fake numbers must fail
    test('deep: fake fails',  () => expect(v.aadhaar('234567890123', deep: true), isNotNull));
  });

  // ── PAN ──────────────────────────────────────────────────────────────────
  group('PAN', () {
    test('valid PAN',      () => expect(v.pan('ABCDE1234F'), isNull));
    test('lowercase',      () => expect(v.pan('abcde1234f'), isNull));
    test('empty',          () => expect(v.pan(''), isNotNull));
    test('invalid format', () => expect(v.pan('AB1234567F'), isNotNull));
  });

  // ── GST ──────────────────────────────────────────────────────────────────
  group('GST', () {
    test('valid GST', () => expect(v.gst('27AAPFU0939F1ZV'), isNull));
    test('empty',     () => expect(v.gst(''), isNotNull));
    test('invalid',   () => expect(v.gst('INVALIDGST'), isNotNull));
  });

  // ── IFSC ─────────────────────────────────────────────────────────────────
  group('IFSC', () {
    test('valid SBI',        () => expect(v.ifsc('SBIN0001234'), isNull));
    test('valid HDFC',       () => expect(v.ifsc('HDFC0000001'), isNull));
    test('empty',            () => expect(v.ifsc(''), isNotNull));
    test('5th char not 0',   () => expect(v.ifsc('SBIN1001234'), isNotNull));
  });

  // ── UPI ──────────────────────────────────────────────────────────────────
  group('UPI', () {
    test('valid UPI',   () => expect(v.upi('name@paytm'), isNull));
    test('mobile UPI',  () => expect(v.upi('9876543210@upi'), isNull));
    test('empty',       () => expect(v.upi(''), isNotNull));
    test('no @',        () => expect(v.upi('nameonlyupi'), isNotNull));
  });

  // ── Pincode ──────────────────────────────────────────────────────────────
  group('Pincode', () {
    test('valid',       () => expect(v.pincode('380001'), isNull));
    test('empty',       () => expect(v.pincode(''), isNotNull));
    test('starts 0',    () => expect(v.pincode('012345'), isNotNull));
    test('too short',   () => expect(v.pincode('38000'), isNotNull));
  });

  // ── Phone ────────────────────────────────────────────────────────────────
  group('Phone', () {
    test('valid',       () => expect(v.phone('9876543210'), isNull));
    test('with +91',    () => expect(v.phone('+919876543210'), isNull));
    test('with 91',     () => expect(v.phone('919876543210'), isNull));
    test('empty',       () => expect(v.phone(''), isNotNull));
    test('starts 5',    () => expect(v.phone('5876543210'), isNotNull));
  });

  // ── Email ────────────────────────────────────────────────────────────────
  group('Email', () {
    test('valid',    () => expect(v.email('test@example.com'), isNull));
    test('empty',    () => expect(v.email(''), isNotNull));
    test('no @',     () => expect(v.email('invalidemail.com'), isNotNull));
  });

  // ── Vehicle ──────────────────────────────────────────────────────────────
  group('Vehicle Number', () {
    test('valid GJ',       () => expect(v.vehicle('GJ01AB1234'), isNull));
    test('with spaces',    () => expect(v.vehicle('GJ 01 AB 1234'), isNull));
    test('empty',          () => expect(v.vehicle(''), isNotNull));
  });

  // ── Bank Account ─────────────────────────────────────────────────────────
  group('Bank Account', () {
    test('valid 11-digit', () => expect(v.bankAccount('12345678901'), isNull));
    test('valid 9-digit',  () => expect(v.bankAccount('123456789'), isNull));
    test('empty',          () => expect(v.bankAccount(''), isNotNull));
    test('too short',      () => expect(v.bankAccount('12345678'), isNotNull));
  });

  // ── Password ─────────────────────────────────────────────────────────────
  group('Password', () {
    test('strong',      () => expect(v.password('Secure@123'), isNull));
    test('empty',       () => expect(v.password(''), isNotNull));
    test('no uppercase',() => expect(v.password('secure@123'), isNotNull));
    test('no symbol',   () => expect(v.password('Secure1234'), isNotNull));
  });

  // ── Card Number ──────────────────────────────────────────────────────────
  group('Card Number', () {
    test('valid Visa',    () => expect(v.cardNumber('4111111111111111'), isNull));
    test('empty',         () => expect(v.cardNumber(''), isNotNull));
    test('invalid Luhn',  () => expect(v.cardNumber('1234567890123456'), isNotNull));
  });

  // ── SWIFT ────────────────────────────────────────────────────────────────
  group('SWIFT', () {
    test('valid 8-char',  () => expect(v.swift('SBININBB'), isNull));
    test('valid 11-char', () => expect(v.swift('SBININBB123'), isNull));
    test('empty',         () => expect(v.swift(''), isNotNull));
  });

  // ── Toll-free ────────────────────────────────────────────────────────────
  group('Toll-free', () {
    test('valid 1800', () => expect(v.tollFree('18001234567'), isNull));
    test('valid 1860', () => expect(v.tollFree('18601234567'), isNull));
    test('empty',      () => expect(v.tollFree(''), isNotNull));
    test('invalid',    () => expect(v.tollFree('9876543210'), isNotNull));
  });

  // ── Ration Card ──────────────────────────────────────────────────────────
  group('Ration Card', () {
    test('valid',   () => expect(v.rationCard('GJ123456789012'), isNull));
    test('empty',   () => expect(v.rationCard(''), isNotNull));
    test('invalid', () => expect(v.rationCard('12345'), isNotNull));
  });

  // ── OTP ──────────────────────────────────────────────────────────────────
  group('OTP', () {
    test('valid 6-digit', () => expect(v.otp('123456'), isNull));
    test('valid 4-digit', () => expect(v.otp('1234', length: 4), isNull));
    test('empty',         () => expect(v.otp(''), isNotNull));
    test('letters',       () => expect(v.otp('ABCDEF'), isNotNull));
  });

  // ── Multi-language ────────────────────────────────────────────────────────
  group('Multi-language', () {
    test('Hindi aadhaar error', () {
      final h = BharatValidator(locale: BharatLocale.hindi);
      expect(h.aadhaar(''), contains('आधार'));
    });
    test('Gujarati phone error', () {
      final g = BharatValidator(locale: BharatLocale.gujarati);
      expect(g.phone(''), contains('ફોન'));
    });
    test('English pan error', () {
      final e = BharatValidator(locale: BharatLocale.english);
      expect(e.pan(''), contains('PAN'));
    });
  });
}