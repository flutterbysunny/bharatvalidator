import 'bharatvalidator.dart';


/// 🇮🇳 BharatValidator — Ultimate India-specific form validation.
///
/// Usage:
/// ```dart
/// final v = BharatValidator();                          // English
/// final v = BharatValidator(locale: BharatLocale.hindi);    // Hindi
/// final v = BharatValidator(locale: BharatLocale.gujarati); // Gujarati
///
/// TextFormField(validator: v.aadhaar)
/// TextFormField(validator: v.pan)
/// TextFormField(validator: (val) => v.otp(val, length: 6))
/// TextFormField(validator: (val) => v.dob(val, minAge: 18))
/// TextFormField(validator: (val) => v.amount(val, min: 1, max: 100000))
/// ```
class BharatValidator {
  final BharatMessages _msg;

  BharatValidator({BharatLocale locale = BharatLocale.english})
      : _msg = BharatMessages(locale: locale);

  // ── Identity ──────────────────────────────────────────────────────────────
  String? aadhaar(String? v)   => AadhaarValidator(_msg).validate(v);
  String? pan(String? v)       => PanValidator(_msg).validate(v);
  String? passport(String? v)  => PassportValidator(_msg).validate(v);
  String? voterId(String? v)   => VoterIdValidator(_msg).validate(v);
  String? drivingLicense(String? v) => DrivingLicenseValidator(_msg).validate(v);

  // ── Tax & Business ────────────────────────────────────────────────────────
  String? gst(String? v)   => GstValidator(_msg).validate(v);
  String? tan(String? v)   => TanValidator(_msg).validate(v);
  String? cin(String? v)   => CinValidator(_msg).validate(v);
  String? fssai(String? v) => FssaiValidator(_msg).validate(v);
  String? udyam(String? v) => UdyamValidator(_msg).validate(v);
  String? rera(String? v)  => ReraValidator(_msg).validate(v);

  // ── Banking & Finance ─────────────────────────────────────────────────────
  String? ifsc(String? v)        => IfscValidator(_msg).validate(v);
  String? upi(String? v)         => UpiValidator(_msg).validate(v);
  String? bankAccount(String? v) => BankAccountValidator(_msg).validate(v);
  String? cardNumber(String? v)  => CardNumberValidator(_msg).validate(v);
  String? micr(String? v)        => MicrValidator(_msg).validate(v);
  String? epf(String? v)         => EpfValidator(_msg).validate(v);

  /// Amount validator with optional min/max (in ₹).
  /// Example: `v.amount(val, min: 1, max: 100000)`
  String? amount(String? v, {double? min, double? max}) =>
      AmountValidator(_msg, min: min, max: max).validate(v);

  // ── Contact ───────────────────────────────────────────────────────────────
  String? phone(String? v)    => PhoneValidator(_msg).validate(v);
  String? email(String? v)    => EmailValidator(_msg).validate(v);
  String? landline(String? v) => LandlineValidator(_msg).validate(v);

  // ── Health ────────────────────────────────────────────────────────────────
  String? abha(String? v) => AbhaValidator(_msg).validate(v);

  // ── Address ───────────────────────────────────────────────────────────────
  String? pincode(String? v) => PincodeValidator(_msg).validate(v);

  // ── Vehicle ───────────────────────────────────────────────────────────────
  String? vehicle(String? v) => VehicleValidator(_msg).validate(v);

  // ── Personal ──────────────────────────────────────────────────────────────
  String? name(String? v)     => NameValidator(_msg).validate(v);
  String? password(String? v) => PasswordValidator(_msg).validate(v);
  String? username(String? v) => UsernameValidator(_msg).validate(v);

  /// DOB validator with optional minAge/maxAge.
  /// Example: `v.dob(val, minAge: 18, maxAge: 60)`
  String? dob(String? v, {int? minAge, int? maxAge}) =>
      DobValidator(_msg, minAge: minAge, maxAge: maxAge).validate(v);

  // ── Digital ───────────────────────────────────────────────────────────────
  String? url(String? v) => UrlValidator(_msg).validate(v);

  /// OTP validator. Default length is 6.
  /// Example: `v.otp(val, length: 4)`
  String? otp(String? v, {int length = 6}) =>
      OtpValidator(_msg, length: length).validate(v);
}