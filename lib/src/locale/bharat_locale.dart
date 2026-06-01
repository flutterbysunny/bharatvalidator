/// Supported languages for BharatValidator error messages.
enum BharatLocale { english, hindi, gujarati }

/// Centralized error message resolver for all validators.
class BharatMessages {
  final BharatLocale locale;
  const BharatMessages({this.locale = BharatLocale.english});

  // ── Aadhaar ──────────────────────────────────────────────────────────────
  String get aadhaarRequired => _p('Aadhaar number is required.', 'आधार नंबर आवश्यक है।', 'આધાર નંબર જરૂરી છે.');
  String get aadhaarInvalid  => _p('Enter a valid 12-digit Aadhaar number.', 'मान्य 12 अंकों का आधार नंबर दर्ज करें।', 'માન્ય 12 અંકનો આધાર નંબર દાખલ કરો.');

  // ── PAN ──────────────────────────────────────────────────────────────────
  String get panRequired => _p('PAN number is required.', 'PAN नंबर आवश्यक है।', 'PAN નંબર જરૂરી છે.');
  String get panInvalid  => _p('Enter a valid PAN (e.g. ABCDE1234F).', 'मान्य PAN दर्ज करें (जैसे ABCDE1234F)।', 'માન્ય PAN દાખલ કરો (દા.ત. ABCDE1234F).');

  // ── GST ──────────────────────────────────────────────────────────────────
  String get gstRequired => _p('GST number is required.', 'GST नंबर आवश्यक है।', 'GST નંબર જરૂરી છે.');
  String get gstInvalid  => _p('Enter a valid GST number with correct state code and checksum.', 'मान्य GST नंबर दर्ज करें (सही स्टेट कोड और चेकसम)।', 'માન્ય GST નંબર દાખલ કરો (સાચો સ્ટેટ કોડ અને ચેકસમ).');

  // ── IFSC ─────────────────────────────────────────────────────────────────
  String get ifscRequired => _p('IFSC code is required.', 'IFSC कोड आवश्यक है।', 'IFSC કોડ જરૂરી છે.');
  String get ifscInvalid  => _p('Enter a valid IFSC code (e.g. SBIN0001234).', 'मान्य IFSC कोड दर्ज करें (जैसे SBIN0001234)।', 'માન્ય IFSC કોડ દાખલ કરો (દા.ત. SBIN0001234).');

  // ── UPI ──────────────────────────────────────────────────────────────────
  String get upiRequired => _p('UPI ID is required.', 'UPI ID आवश्यक है।', 'UPI ID જરૂરી છે.');
  String get upiInvalid  => _p('Enter a valid UPI ID (e.g. name@upi).', 'मान्य UPI ID दर्ज करें (जैसे name@upi)।', 'માન્ય UPI ID દાખલ કરો (દા.ત. name@upi).');

  // ── Pincode ──────────────────────────────────────────────────────────────
  String get pincodeRequired => _p('Pincode is required.', 'पिनकोड आवश्यक है।', 'પિનકોડ જરૂરી છે.');
  String get pincodeInvalid  => _p('Enter a valid 6-digit Indian pincode.', 'मान्य 6 अंकों का भारतीय पिनकोड दर्ज करें।', 'માન્ય 6 અંકનો ભારતીય પિનકોડ દાખલ કરો.');

  // ── Phone ────────────────────────────────────────────────────────────────
  String get phoneRequired => _p('Phone number is required.', 'फोन नंबर आवश्यक है।', 'ફોન નંબર જરૂરી છે.');
  String get phoneInvalid  => _p('Enter a valid 10-digit Indian mobile number.', 'मान्य 10 अंकों का भारतीय मोबाइल नंबर दर्ज करें।', 'માન્ય 10 અંકનો ભારતીય મોબાઇલ નંબર દાખલ કરો.');

  // ── Email ────────────────────────────────────────────────────────────────
  String get emailRequired => _p('Email is required.', 'ईमेल आवश्यक है।', 'ઈમેઇલ જરૂરી છે.');
  String get emailInvalid  => _p('Enter a valid email address.', 'मान्य ईमेल पता दर्ज करें।', 'માન્ય ઈમેઇલ સરનામું દાખલ કરો.');

  // ── Vehicle ──────────────────────────────────────────────────────────────
  String get vehicleRequired => _p('Vehicle number is required.', 'वाहन नंबर आवश्यक है।', 'વાહન નંબર જરૂરી છે.');
  String get vehicleInvalid  => _p('Enter a valid Indian vehicle number (e.g. GJ01AB1234).', 'मान्य भारतीय वाहन नंबर दर्ज करें।', 'માન્ય ભારતીય વાહન નંબર દાખલ કરો.');

  // ── Passport ─────────────────────────────────────────────────────────────
  String get passportRequired => _p('Passport number is required.', 'पासपोर्ट नंबर आवश्यक है।', 'પાસપોર્ટ નંબર જરૂરી છે.');
  String get passportInvalid  => _p('Enter a valid Indian passport number (e.g. A1234567).', 'मान्य भारतीय पासपोर्ट नंबर दर्ज करें।', 'માન્ય ભારતીય પાસપોર્ટ નંબર દાખલ કરો.');

  // ── Voter ID ─────────────────────────────────────────────────────────────
  String get voterIdRequired => _p('Voter ID is required.', 'मतदाता पहचान पत्र आवश्यक है।', 'મતદાર ID જરૂરી છે.');
  String get voterIdInvalid  => _p('Enter a valid Voter ID (e.g. ABC1234567).', 'मान्य मतदाता पहचान पत्र दर्ज करें।', 'માન્ય મતદાર ID દાખલ કરો.');

  // ── Bank Account ─────────────────────────────────────────────────────────
  String get bankAccountRequired => _p('Bank account number is required.', 'बैंक खाता नंबर आवश्यक है।', 'બેંક ખાતા નંબર જરૂરી છે.');
  String get bankAccountInvalid  => _p('Enter a valid bank account number (9–18 digits).', 'मान्य बैंक खाता नंबर दर्ज करें (9–18 अंक)।', 'માન્ય બેંક ખાતા નંબર દાખલ કરો (9–18 અંક).');

  // ── Name ─────────────────────────────────────────────────────────────────
  String get nameRequired => _p('Name is required.', 'नाम आवश्यक है।', 'નામ જરૂરી છે.');
  String get nameInvalid  => _p('Enter a valid name (letters only).', 'मान्य नाम दर्ज करें (केवल अक्षर)।', 'માન્ય નામ દાખલ કરો (ફક્ત અક્ષરો).');

  // ── Password ─────────────────────────────────────────────────────────────
  String get passwordRequired => _p('Password is required.', 'पासवर्ड आवश्यक है।', 'પાસવર્ડ જરૂરી છે.');
  String get passwordWeak     => _p('Password must be 8+ chars with uppercase, lowercase, number & symbol.', 'पासवर्ड में 8+ अक्षर, अपरकेस, लोअरकेस, नंबर और सिम्बल होना चाहिए।', 'પાસવર્ડ 8+ અક્ષર, અપરકેસ, લોઅરકેસ, નંબર અને સિમ્બોલ સાથે હોવો જોઈએ.');

  // ── Driving License ───────────────────────────────────────────────────────
  String get drivingLicenseRequired => _p('Driving license number is required.', 'ड्राइविंग लाइसेंस नंबर आवश्यक है।', 'ડ્રાઇવિંગ લાઇસન્સ નંબર જરૂરી છે.');
  String get drivingLicenseInvalid  => _p('Enter a valid driving license number.', 'मान्य ड्राइविंग लाइसेंस दर्ज करें।', 'માન્ય ડ્રાઇવિંગ લાઇસન્સ દાખલ કરો.');

  // ── CIN ──────────────────────────────────────────────────────────────────
  String get cinRequired => _p('CIN is required.', 'CIN नंबर आवश्यक है।', 'CIN નંબર જરૂરી છે.');
  String get cinInvalid  => _p('Enter a valid CIN (e.g. U67190TN2014PTC096978).', 'मान्य CIN दर्ज करें।', 'માન્ય CIN દાખલ કરો.');

  // ── TAN ──────────────────────────────────────────────────────────────────
  String get tanRequired => _p('TAN is required.', 'TAN नंबर आवश्यक है।', 'TAN નંબર જરૂરી છે.');
  String get tanInvalid  => _p('Enter a valid TAN (e.g. PDES03028F).', 'मान्य TAN दर्ज करें।', 'માન્ય TAN દાખલ કરો.');

  // ── OTP ──────────────────────────────────────────────────────────────────
  String get otpRequired => _p('OTP is required.', 'OTP आवश्यक है।', 'OTP જરૂરી છે.');
  String otpInvalid(int len) => _p('Enter a valid $len-digit OTP.', 'मान्य $len अंकों का OTP दर्ज करें।', 'માન્ય $len અંકનો OTP દાખલ કરો.');

  // ── FSSAI ────────────────────────────────────────────────────────────────
  String get fssaiRequired => _p('FSSAI license number is required.', 'FSSAI लाइसेंस नंबर आवश्यक है।', 'FSSAI લાઇસન્સ નંબર જરૂરી છે.');
  String get fssaiInvalid  => _p('Enter a valid 14-digit FSSAI license number.', 'मान्य 14 अंकों का FSSAI लाइसेंस नंबर दर्ज करें।', 'માન્ય 14 અંકનો FSSAI લાઇસન્સ નંબર દાખલ કરો.');

  // ── Card Number ───────────────────────────────────────────────────────────
  String get cardRequired => _p('Card number is required.', 'कार्ड नंबर आवश्यक है।', 'કાર્ડ નંબર જરૂરી છે.');
  String get cardInvalid  => _p('Enter a valid card number.', 'मान्य कार्ड नंबर दर्ज करें।', 'માન્ય કાર્ડ નંબર દાખલ કરો.');

  // ── MICR ─────────────────────────────────────────────────────────────────
  String get micrRequired => _p('MICR code is required.', 'MICR कोड आवश्यक है।', 'MICR કોડ જરૂરી છે.');
  String get micrInvalid  => _p('Enter a valid 9-digit MICR code.', 'मान्य 9 अंकों का MICR कोड दर्ज करें।', 'માન્ય 9 અંકનો MICR કોડ દાખલ કરો.');

  // ── ABHA ─────────────────────────────────────────────────────────────────
  String get abhaRequired => _p('ABHA number is required.', 'ABHA नंबर आवश्यक है।', 'ABHA નંબર જરૂરી છે.');
  String get abhaInvalid  => _p('Enter a valid ABHA number (14 digits) or address (name@abdm).', 'मान्य ABHA नंबर (14 अंक) या एड्रेस दर्ज करें।', 'માન્ય ABHA નંબર (14 અંક) અથવા સરનામું દાખલ કરો.');

  // ── EPF ──────────────────────────────────────────────────────────────────
  String get epfRequired => _p('EPF account number is required.', 'EPF खाता नंबर आवश्यक है।', 'EPF ખાતા નંબર જરૂરી છે.');
  String get epfInvalid  => _p('Enter a valid EPF number (e.g. MH/BAN/0012345/000/0001234).', 'मान्य EPF नंबर दर्ज करें।', 'માન્ય EPF નંબર દાખલ કરો.');

  // ── DOB ──────────────────────────────────────────────────────────────────
  String get dobRequired  => _p('Date of birth is required.', 'जन्म तिथि आवश्यक है।', 'જન્મ તારીખ જરૂરી છે.');
  String get dobInvalid   => _p('Enter a valid date (DD/MM/YYYY).', 'मान्य तिथि दर्ज करें (DD/MM/YYYY)।', 'માન્ય તારીખ દાખલ કરો (DD/MM/YYYY).');
  String get dobFuture    => _p('Date of birth cannot be in the future.', 'जन्म तिथि भविष्य में नहीं हो सकती।', 'જન્મ તારીખ ભવિષ્યની ન હોઈ શકે.');
  String dobMinAge(int age) => _p('Minimum age required is $age years.', 'न्यूनतम आयु $age वर्ष होनी चाहिए।', 'લઘુત્તમ ઉંમર $age વર્ષ હોવી જોઈએ.');
  String dobMaxAge(int age) => _p('Maximum age allowed is $age years.', 'अधिकतम आयु $age वर्ष होनी चाहिए।', 'મહત્તમ ઉંમર $age વર્ષ હોવી જોઈએ.');

  // ── Amount ───────────────────────────────────────────────────────────────
  String get amountRequired => _p('Amount is required.', 'राशि आवश्यक है।', 'રકમ જરૂરી છે.');
  String get amountInvalid  => _p('Enter a valid amount.', 'मान्य राशि दर्ज करें।', 'માન્ય રકમ દાખલ કરો.');
  String amountMin(double min) => _p('Minimum amount is ₹$min.', 'न्यूनतम राशि ₹$min है।', 'લઘુત્તમ રકમ ₹$min છે.');
  String amountMax(double max) => _p('Maximum amount is ₹$max.', 'अधिकतम राशि ₹$max है।', 'મહત્તમ રકમ ₹$max છે.');

  // ── URL ──────────────────────────────────────────────────────────────────
  String get urlRequired => _p('URL is required.', 'URL आवश्यक है।', 'URL જરૂરી છે.');
  String get urlInvalid  => _p('Enter a valid URL (e.g. https://example.com).', 'मान्य URL दर्ज करें।', 'માન્ય URL દાખલ કરો.');

  // ── Username ─────────────────────────────────────────────────────────────
  String get usernameRequired => _p('Username is required.', 'यूजरनेम आवश्यक है।', 'યુઝરનેમ જરૂરી છે.');
  String get usernameInvalid  => _p('Username must be 3–20 chars (letters, digits, _ or -).', 'यूजरनेम 3–20 अक्षर का होना चाहिए।', 'યુઝરનેમ 3–20 અક્ષરનું હોવું જોઈએ.');

  // ── Landline ─────────────────────────────────────────────────────────────
  String get landlineRequired => _p('Landline number is required.', 'लैंडलाइन नंबर आवश्यक है।', 'લેન્ડલાઇન નંબર જરૂરી છે.');
  String get landlineInvalid  => _p('Enter a valid Indian landline number (e.g. 02212345678).', 'मान्य भारतीय लैंडलाइन नंबर दर्ज करें।', 'માન્ય ભારતીય લેન્ડલાઇન નંબર દાખલ કરો.');

  // ── RERA ─────────────────────────────────────────────────────────────────
  String get reraRequired => _p('RERA number is required.', 'RERA नंबर आवश्यक है।', 'RERA નંબર જરૂરી છે.');
  String get reraInvalid  => _p('Enter a valid RERA registration number.', 'मान्य RERA नंबर दर्ज करें।', 'માન્ય RERA નંબર દાખલ કરો.');

  // ── Udyam ────────────────────────────────────────────────────────────────
  String get udyamRequired => _p('Udyam registration number is required.', 'उद्यम नंबर आवश्यक है।', 'ઉદ્યમ નંબર જરૂરી છે.');
  String get udyamInvalid  => _p('Enter a valid Udyam number (e.g. UDYAM-MH-01-0012345).', 'मान्य उद्यम नंबर दर्ज करें।', 'માન્ય ઉદ્યમ નંબર દાખલ કરો.');

  // ── SWIFT ────────────────────────────────────────────────────────────────
  String get swiftRequired => _p('SWIFT/BIC code is required.', 'SWIFT/BIC कोड आवश्यक है।', 'SWIFT/BIC કોડ જરૂરી છે.');
  String get swiftInvalid  => _p('Enter a valid SWIFT/BIC code (e.g. SBININBB).', 'मान्य SWIFT/BIC कोड दर्ज करें (जैसे SBININBB)।', 'માન્ય SWIFT/BIC કોડ દાખલ કરો (દા.ત. SBININBB).');

  // ── Ration Card ──────────────────────────────────────────────────────────
  String get rationCardRequired => _p('Ration card number is required.', 'राशन कार्ड नंबर आवश्यक है।', 'રેશન કાર્ડ નંબર જરૂરી છે.');
  String get rationCardInvalid  => _p('Enter a valid ration card number.', 'मान्य राशन कार्ड नंबर दर्ज करें।', 'માન્ય રેશન કાર્ડ નંબર દાખલ કરો.');

  // ── Toll-free ────────────────────────────────────────────────────────────
  String get tollFreeRequired => _p('Toll-free number is required.', 'टोल-फ्री नंबर आवश्यक है।', 'ટોલ-ફ્રી નંબર જરૂરી છે.');
  String get tollFreeInvalid  => _p('Enter a valid toll-free number (e.g. 1800-123-4567).', 'मान्य टोल-फ्री नंबर दर्ज करें (जैसे 1800-123-4567)।', 'માન્ય ટોલ-ફ્રી નંબર દાખલ કરો (દા.ત. 1800-123-4567).');

  // ─────────────────────────────────────────────────────────────────────────
  String _p(String en, String hi, String gu) {
    switch (locale) {
      case BharatLocale.hindi:    return hi;
      case BharatLocale.gujarati: return gu;
      default:                    return en;
    }
  }
}