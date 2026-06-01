# Changelog

All notable changes to **BharatValidator** will be documented in this file.

## 1.0.1 — New Validators

swift — SWIFT/BIC code for international bank transfers
rationCard — Indian ration card number
tollFree — Indian toll-free numbers (1800, 1860, 1900)

🔒 Deep Validation (Breaking Improvement)

aadhaar — Now uses Verhoeff checksum algorithm (same as UIDAI) — rejects fake numbers
gst — Now validates state code (01–37) + checksum character — rejects invalid GST

💅 Example App Improvements

Search bar — filter validators by name or category instantly
Copy button — copy hint value to clipboard on every field
Stats bar — shows total validator count and language count
Better section headers — colored left border accent
Cleaner architecture — _ValidatorItem model, grouped rendering

---

## 1.0.0 — Initial Release

### 🎉 First stable release of BharatValidator — India-first Flutter form validation package.

#### ✅ 30+ Validators added

**🪪 Identity**
- `aadhaar` — 12-digit Aadhaar number (starts 2–9)
- `pan` — PAN card (ABCDE1234F format)
- `passport` — Indian passport number
- `voterId` — Voter ID / EPIC number
- `drivingLicense` — Indian driving license number

**🏢 Tax & Business**
- `gst` — 15-character GST number
- `tan` — TAN (Tax Deduction Account Number)
- `cin` — Company Identification Number
- `fssai` — FSSAI license number (14 digits)
- `udyam` — Udyam / MSME registration number
- `rera` — RERA registration number

**🏦 Banking & Finance**
- `ifsc` — Bank IFSC code
- `upi` — UPI ID (name@handle)
- `bankAccount` — Bank account number (9–18 digits)
- `cardNumber` — Credit/Debit card with Luhn algorithm
- `micr` — MICR code (9 digits)
- `epf` — EPF / PF account number
- `amount` — Indian currency amount with optional min/max

**📞 Contact**
- `phone` — 10-digit Indian mobile number (+91 supported)
- `email` — Email address
- `landline` — Indian landline number with STD code

**🏥 Health**
- `abha` — ABHA / Ayushman Bharat Health Account number

**📍 Address & Vehicle**
- `pincode` — 6-digit Indian pincode
- `vehicle` — Indian vehicle registration number (GJ01AB1234)

**👤 Personal**
- `name` — Full name (supports Devanagari & Gujarati scripts)
- `password` — Strong password (8+ chars, upper, lower, digit, symbol)
- `username` — Username (3–20 chars, letters/digits/_/-)
- `dob` — Date of birth with optional min/max age validation

**🌐 Digital**
- `url` — Website URL (http/https)
- `otp` — OTP validator (4 or 6 digit)

#### 🌐 Multi-language error messages
- English 🇬🇧
- Hindi 🇮🇳
- Gujarati 🟠

#### 📖 Usage
```dart
final v = BharatValidator();                           // English
final v = BharatValidator(locale: BharatLocale.hindi); // Hindi

TextFormField(validator: v.aadhaar)
TextFormField(validator: v.pan)
TextFormField(validator: (val) => v.dob(val, minAge: 18))
TextFormField(validator: (val) => v.amount(val, min: 1, max: 100000))
TextFormField(validator: (val) => v.otp(val, length: 6))
```