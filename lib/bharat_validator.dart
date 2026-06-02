import 'bharatvalidator.dart';


/// 🇮🇳 **BharatValidator** — Ultimate India-specific Flutter form validation.
///
/// Provides 33+ validators for Indian identity, tax, banking, contact,
/// health, address, and digital fields. Supports English, Hindi & Gujarati
/// error messages out of the box.
///
/// ## Basic Usage
/// ```dart
/// final v = BharatValidator(); // English (default)
/// final v = BharatValidator(locale: BharatLocale.hindi);    // Hindi
/// final v = BharatValidator(locale: BharatLocale.gujarati); // Gujarati
///
/// TextFormField(validator: v.aadhaar)
/// TextFormField(validator: v.pan)
/// TextFormField(validator: (val) => v.dob(val, minAge: 18))
/// TextFormField(validator: (val) => v.amount(val, min: 1, max: 100000))
/// TextFormField(validator: (val) => v.otp(val, length: 6))
/// ```
class BharatValidator {
  final BharatMessages _msg;

  /// Creates a [BharatValidator] instance.
  ///
  /// [locale] sets the language for all error messages.
  /// Defaults to [BharatLocale.english].
  ///
  /// ```dart
  /// final v = BharatValidator();
  /// final v = BharatValidator(locale: BharatLocale.hindi);
  /// ```
  BharatValidator({BharatLocale locale = BharatLocale.english})
      : _msg = BharatMessages(locale: locale);

  // ── Identity ──────────────────────────────────────────────────────────────

  /// Validates a 12-digit Indian Aadhaar number.
  ///
  /// - Must start with digits 2–9
  /// - Uses Verhoeff checksum algorithm (same as UIDAI)
  ///
  /// ```dart
  /// TextFormField(validator: v.aadhaar)
  /// ```
  String? aadhaar(String? v, {bool deep = false}) =>
      AadhaarValidator(_msg, deep: deep).validate(v);

  /// Validates an Indian PAN card number.
  ///
  /// Format: 5 letters + 4 digits + 1 letter (e.g. `ABCDE1234F`).
  ///
  /// ```dart
  /// TextFormField(validator: v.pan)
  /// ```
  String? pan(String? v) => PanValidator(_msg).validate(v);

  /// Validates an Indian passport number.
  ///
  /// Format: 1 letter + 7 digits (e.g. `A1234567`).
  ///
  /// ```dart
  /// TextFormField(validator: v.passport)
  /// ```
  String? passport(String? v) => PassportValidator(_msg).validate(v);

  /// Validates an Indian Voter ID / EPIC number.
  ///
  /// Format: 3 letters + 7 digits (e.g. `ABC1234567`).
  ///
  /// ```dart
  /// TextFormField(validator: v.voterId)
  /// ```
  String? voterId(String? v) => VoterIdValidator(_msg).validate(v);

  /// Validates an Indian driving license number.
  ///
  /// Format: 2-letter state code + 2-digit RTO + 4-digit year + 7 digits.
  ///
  /// ```dart
  /// TextFormField(validator: v.drivingLicense)
  /// ```
  String? drivingLicense(String? v) => DrivingLicenseValidator(_msg).validate(v);

  /// Validates an Indian ration card number.
  ///
  /// Format: 2-letter state code + 10–14 alphanumeric characters.
  ///
  /// ```dart
  /// TextFormField(validator: v.rationCard)
  /// ```
  String? rationCard(String? v) => RationCardValidator(_msg).validate(v);

  // ── Tax & Business ────────────────────────────────────────────────────────

  /// Validates an Indian GST number with state code and checksum verification.
  ///
  /// Format: 15 characters (e.g. `27AAPFU0939F1ZV`).
  ///
  /// ```dart
  /// TextFormField(validator: v.gst)
  /// ```
  String? gst(String? v) => GstValidator(_msg).validate(v);

  /// Validates an Indian TAN (Tax Deduction Account Number).
  ///
  /// Format: 4 letters + 5 digits + 1 letter (e.g. `PDES03028F`).
  ///
  /// ```dart
  /// TextFormField(validator: v.tan)
  /// ```
  String? tan(String? v) => TanValidator(_msg).validate(v);

  /// Validates an Indian CIN (Company Identification Number).
  ///
  /// Format: U/L + 5 digits + 2 letters + 4 digits + 3 letters + 6 digits.
  /// Example: `U67190TN2014PTC096978`.
  ///
  /// ```dart
  /// TextFormField(validator: v.cin)
  /// ```
  String? cin(String? v) => CinValidator(_msg).validate(v);

  /// Validates an FSSAI food license number.
  ///
  /// Format: 14 digits.
  ///
  /// ```dart
  /// TextFormField(validator: v.fssai)
  /// ```
  String? fssai(String? v) => FssaiValidator(_msg).validate(v);

  /// Validates an Udyam / MSME registration number.
  ///
  /// Format: `UDYAM-XX-00-0000000` (e.g. `UDYAM-MH-01-0012345`).
  ///
  /// ```dart
  /// TextFormField(validator: v.udyam)
  /// ```
  String? udyam(String? v) => UdyamValidator(_msg).validate(v);

  /// Validates a RERA (Real Estate Regulatory Authority) registration number.
  ///
  /// ```dart
  /// TextFormField(validator: v.rera)
  /// ```
  String? rera(String? v) => ReraValidator(_msg).validate(v);

  // ── Banking & Finance ─────────────────────────────────────────────────────

  /// Validates an Indian bank IFSC code.
  ///
  /// Format: 4 letters + `0` + 6 alphanumeric (e.g. `SBIN0001234`).
  ///
  /// ```dart
  /// TextFormField(validator: v.ifsc)
  /// ```
  String? ifsc(String? v) => IfscValidator(_msg).validate(v);

  /// Validates an Indian UPI ID.
  ///
  /// Format: `name@handle` (e.g. `rahul@paytm`).
  ///
  /// ```dart
  /// TextFormField(validator: v.upi)
  /// ```
  String? upi(String? v) => UpiValidator(_msg).validate(v);

  /// Validates an Indian bank account number.
  ///
  /// Accepts 9 to 18 digit numeric values.
  ///
  /// ```dart
  /// TextFormField(validator: v.bankAccount)
  /// ```
  String? bankAccount(String? v) => BankAccountValidator(_msg).validate(v);

  /// Validates a credit or debit card number using the Luhn algorithm.
  ///
  /// Works for Visa, Mastercard, RuPay, Amex, and all major card networks.
  ///
  /// ```dart
  /// TextFormField(validator: v.cardNumber)
  /// ```
  String? cardNumber(String? v) => CardNumberValidator(_msg).validate(v);

  /// Validates a 9-digit bank MICR code.
  ///
  /// Format: 3-digit city + 3-digit bank + 3-digit branch.
  ///
  /// ```dart
  /// TextFormField(validator: v.micr)
  /// ```
  String? micr(String? v) => MicrValidator(_msg).validate(v);

  /// Validates an Indian EPF / PF account number.
  ///
  /// Format: `SS/RO/XXXXXXX/000/XXXXXXX` (e.g. `MH/BAN/0012345/000/0001234`).
  ///
  /// ```dart
  /// TextFormField(validator: v.epf)
  /// ```
  String? epf(String? v) => EpfValidator(_msg).validate(v);

  /// Validates an international SWIFT / BIC code.
  ///
  /// Format: 8 or 11 alphanumeric characters (e.g. `SBININBB`).
  ///
  /// ```dart
  /// TextFormField(validator: v.swift)
  /// ```
  String? swift(String? v) => SwiftValidator(_msg).validate(v);

  /// Validates an Indian currency amount with optional min/max range.
  ///
  /// Accepts ₹ symbol and Indian comma formatting (e.g. `₹1,00,000`).
  ///
  /// ```dart
  /// // Simple
  /// TextFormField(validator: v.amount)
  ///
  /// // With range
  /// TextFormField(validator: (val) => v.amount(val, min: 1, max: 100000))
  /// ```
  String? amount(String? v, {double? min, double? max}) =>
      AmountValidator(_msg, min: min, max: max).validate(v);

  // ── Contact ───────────────────────────────────────────────────────────────

  /// Validates a 10-digit Indian mobile number.
  ///
  /// Accepts formats: `9876543210` / `+919876543210` / `919876543210`.
  ///
  /// ```dart
  /// TextFormField(validator: v.phone)
  /// ```
  String? phone(String? v) => PhoneValidator(_msg).validate(v);

  /// Validates an email address.
  ///
  /// ```dart
  /// TextFormField(validator: v.email)
  /// ```
  String? email(String? v) => EmailValidator(_msg).validate(v);

  /// Validates an Indian landline number with STD code.
  ///
  /// Format: starts with `0`, total 10–11 digits (e.g. `02212345678`).
  ///
  /// ```dart
  /// TextFormField(validator: v.landline)
  /// ```
  String? landline(String? v) => LandlineValidator(_msg).validate(v);

  /// Validates an Indian toll-free number.
  ///
  /// Valid prefixes: `1800`, `1860`, `1900` (e.g. `1800-123-4567`).
  ///
  /// ```dart
  /// TextFormField(validator: v.tollFree)
  /// ```
  String? tollFree(String? v) => TollFreeValidator(_msg).validate(v);

  // ── Health ────────────────────────────────────────────────────────────────

  /// Validates an ABHA (Ayushman Bharat Health Account) number or address.
  ///
  /// Accepts 14-digit number or `name@abdm` format.
  ///
  /// ```dart
  /// TextFormField(validator: v.abha)
  /// ```
  String? abha(String? v) => AbhaValidator(_msg).validate(v);

  // ── Address & Vehicle ─────────────────────────────────────────────────────

  /// Validates a 6-digit Indian PIN code.
  ///
  /// Cannot start with 0 (e.g. `380001`).
  ///
  /// ```dart
  /// TextFormField(validator: v.pincode)
  /// ```
  String? pincode(String? v) => PincodeValidator(_msg).validate(v);

  /// Validates an Indian vehicle registration number.
  ///
  /// Format: 2-letter state + 2-digit RTO + 1–3 letters + 4 digits (e.g. `GJ01AB1234`).
  ///
  /// ```dart
  /// TextFormField(validator: v.vehicle)
  /// ```
  String? vehicle(String? v) => VehicleValidator(_msg).validate(v);

  // ── Personal ──────────────────────────────────────────────────────────────

  /// Validates a person's full name.
  ///
  /// Supports Latin, Devanagari (Hindi), and Gujarati scripts.
  ///
  /// ```dart
  /// TextFormField(validator: v.name)
  /// ```
  String? name(String? v) => NameValidator(_msg).validate(v);

  /// Validates a strong password.
  ///
  /// Requires 8+ characters with at least one uppercase, lowercase,
  /// digit, and special symbol.
  ///
  /// ```dart
  /// TextFormField(validator: v.password)
  /// ```
  String? password(String? v) => PasswordValidator(_msg).validate(v);

  /// Validates a username.
  ///
  /// Allows 3–20 characters: letters, digits, underscores, and hyphens.
  ///
  /// ```dart
  /// TextFormField(validator: v.username)
  /// ```
  String? username(String? v) => UsernameValidator(_msg).validate(v);

  /// Validates a date of birth with optional minimum and maximum age.
  ///
  /// Accepts `DD/MM/YYYY`, `DD-MM-YYYY`, or `YYYY-MM-DD` formats.
  ///
  /// ```dart
  /// // Simple
  /// TextFormField(validator: v.dob)
  ///
  /// // With age restriction
  /// TextFormField(validator: (val) => v.dob(val, minAge: 18, maxAge: 60))
  /// ```
  String? dob(String? v, {int? minAge, int? maxAge}) =>
      DobValidator(_msg, minAge: minAge, maxAge: maxAge).validate(v);

  // ── Digital ───────────────────────────────────────────────────────────────

  /// Validates a website URL.
  ///
  /// Must start with `http://` or `https://`.
  ///
  /// ```dart
  /// TextFormField(validator: v.url)
  /// ```
  String? url(String? v) => UrlValidator(_msg).validate(v);

  /// Validates a numeric OTP of given [length] (default: 6).
  ///
  /// ```dart
  /// // 6-digit OTP
  /// TextFormField(validator: (val) => v.otp(val))
  ///
  /// // 4-digit OTP
  /// TextFormField(validator: (val) => v.otp(val, length: 4))
  /// ```
  String? otp(String? v, {int length = 6}) =>
      OtpValidator(_msg, length: length).validate(v);
}