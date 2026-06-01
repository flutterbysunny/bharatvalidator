# 🇮🇳 BharatValidator

**India-first Flutter form validation package with 30+ validators.**

Validate Aadhaar, PAN, GST, IFSC, UPI, Driving License, Passport, Voter ID, CIN, TAN, FSSAI, ABHA, EPF, Card (Luhn), RERA, Udyam and more — with **English, Hindi & Gujarati** error messages.

[![pub package](https://img.shields.io/pub/v/bharatvalidator.svg)](https://pub.dev/packages/bharatvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## ✨ Features

### 🪪 Identity
| Validator | Description |
|---|---|
| `aadhaar` | 12-digit Aadhaar (starts 2–9) |
| `pan` | PAN card (ABCDE1234F format) |
| `passport` | Indian passport number |
| `voterId` | Voter ID / EPIC number |
| `drivingLicense` | Indian driving license number |

### 🏢 Tax & Business
| Validator | Description |
|---|---|
| `gst` | 15-char GST number |
| `tan` | TAN number (PDES03028F format) |
| `cin` | Company Identification Number |
| `fssai` | FSSAI license number (14 digits) |
| `udyam` | Udyam / MSME registration number |
| `rera` | RERA registration number |

### 🏦 Banking & Finance
| Validator | Description |
|---|---|
| `ifsc` | Bank IFSC code |
| `upi` | UPI ID (name@handle) |
| `bankAccount` | Bank account number (9–18 digits) |
| `cardNumber` | Credit/Debit card number (Luhn algorithm) |
| `micr` | MICR code (9 digits) |
| `epf` | EPF / PF account number |
| `amount` | Indian currency amount with optional min/max (₹) |

### 📞 Contact
| Validator | Description |
|---|---|
| `phone` | 10-digit mobile (+91 supported) |
| `email` | Email address |
| `landline` | Indian landline with STD code |

### 🏥 Health
| Validator | Description |
|---|---|
| `abha` | ABHA / Ayushman Bharat Health Account number |

### 📍 Address & Vehicle
| Validator | Description |
|---|---|
| `pincode` | 6-digit Indian pincode |
| `vehicle` | Indian vehicle number (GJ01AB1234) |

### 👤 Personal
| Validator | Description |
|---|---|
| `name` | Name (supports Devanagari & Gujarati script) |
| `password` | Strong password (8+ chars, upper, lower, digit, symbol) |
| `username` | Username (3–20 chars, letters/digits/_/-) |
| `dob` | Date of birth with optional min/max age |

### 🌐 Digital
| Validator | Description |
|---|---|
| `url` | Website URL (http/https) |
| `otp` | OTP — 4 or 6 digit |

**Multi-language error messages:** English 🇬🇧 · Hindi 🇮🇳 · Gujarati 🟠

---

## 🚀 Installation

```yaml
dependencies:
  bharatvalidator: ^1.0.0
```

```bash
flutter pub get
```

---

## 📖 Usage

### Basic

```dart
import 'package:bharatvalidator/bharatvalidator.dart';

final v = BharatValidator(); // English (default)

TextFormField(
  validator: v.aadhaar, // Pass directly!
)
```

### Change Language

```dart
// Hindi
final v = BharatValidator(locale: BharatLocale.hindi);

// Gujarati
final v = BharatValidator(locale: BharatLocale.gujarati);
```

### Validators with Parameters

```dart
// DOB with minimum age check
TextFormField(
  validator: (val) => v.dob(val, minAge: 18),
)

// Amount with min/max range
TextFormField(
  validator: (val) => v.amount(val, min: 1, max: 100000),
)

// OTP length
TextFormField(
  validator: (val) => v.otp(val, length: 6),
)
```

### Full Form Example

```dart
final v = BharatValidator(locale: BharatLocale.hindi);

Form(
  key: _formKey,
  child: Column(
    children: [
      // Personal
      TextFormField(validator: v.name,          decoration: InputDecoration(labelText: 'Name')),
      TextFormField(validator: v.username,       decoration: InputDecoration(labelText: 'Username')),
      TextFormField(validator: v.phone,          decoration: InputDecoration(labelText: 'Mobile')),
      TextFormField(validator: v.email,          decoration: InputDecoration(labelText: 'Email')),
      TextFormField(validator: v.password,       decoration: InputDecoration(labelText: 'Password')),
      TextFormField(validator: (v) => v.dob(v, minAge: 18), decoration: InputDecoration(labelText: 'DOB')),

      // Government IDs
      TextFormField(validator: v.aadhaar,        decoration: InputDecoration(labelText: 'Aadhaar')),
      TextFormField(validator: v.pan,            decoration: InputDecoration(labelText: 'PAN')),
      TextFormField(validator: v.voterId,        decoration: InputDecoration(labelText: 'Voter ID')),
      TextFormField(validator: v.passport,       decoration: InputDecoration(labelText: 'Passport')),
      TextFormField(validator: v.drivingLicense, decoration: InputDecoration(labelText: 'Driving License')),

      // Tax & Business
      TextFormField(validator: v.gst,            decoration: InputDecoration(labelText: 'GST')),
      TextFormField(validator: v.tan,            decoration: InputDecoration(labelText: 'TAN')),
      TextFormField(validator: v.cin,            decoration: InputDecoration(labelText: 'CIN')),
      TextFormField(validator: v.fssai,          decoration: InputDecoration(labelText: 'FSSAI')),
      TextFormField(validator: v.udyam,          decoration: InputDecoration(labelText: 'Udyam')),

      // Banking
      TextFormField(validator: v.ifsc,           decoration: InputDecoration(labelText: 'IFSC')),
      TextFormField(validator: v.upi,            decoration: InputDecoration(labelText: 'UPI ID')),
      TextFormField(validator: v.bankAccount,    decoration: InputDecoration(labelText: 'Account No.')),
      TextFormField(validator: v.cardNumber,     decoration: InputDecoration(labelText: 'Card Number')),

      ElevatedButton(
        onPressed: () => _formKey.currentState!.validate(),
        child: Text('Submit'),
      ),
    ],
  ),
)
```

---

## 🌐 Supported Languages

```dart
BharatLocale.english   // "Enter a valid 12-digit Aadhaar number."
BharatLocale.hindi     // "मान्य 12 अंकों का आधार नंबर दर्ज करें।"
BharatLocale.gujarati  // "માન્ય 12 અંકનો આધાર નંબર દાખલ કરો."
```

---

## 🏗️ Project Structure

```
bharatvalidator/
├── lib/
│   ├── bharatvalidator.dart              # Main export
│   └── src/
│       ├── bharat_validator.dart         # Main BharatValidator class
│       ├── locale/
│       │   └── bharat_locale.dart        # Multi-language messages
│       └── validators/
│           ├── aadhaar_validator.dart
│           ├── pan_validator.dart
│           ├── gst_validator.dart
│           ├── tan_validator.dart
│           ├── cin_validator.dart
│           ├── ifsc_validator.dart
│           ├── upi_validator.dart
│           ├── pincode_validator.dart
│           ├── phone_validator.dart
│           ├── landline_validator.dart
│           ├── email_validator.dart
│           ├── vehicle_validator.dart
│           ├── passport_validator.dart
│           ├── voter_id_validator.dart
│           ├── driving_license_validator.dart
│           ├── bank_account_validator.dart
│           ├── card_number_validator.dart
│           ├── micr_validator.dart
│           ├── epf_validator.dart
│           ├── fssai_validator.dart
│           ├── abha_validator.dart
│           ├── rera_validator.dart
│           ├── udyam_validator.dart
│           ├── name_validator.dart
│           ├── password_validator.dart
│           ├── username_validator.dart
│           ├── dob_validator.dart
│           ├── amount_validator.dart
│           ├── url_validator.dart
│           └── otp_validator.dart
├── example/                              # Full demo app
└── test/                                 # Unit tests
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📄 License

MIT License © 2026 — Made with ❤️ for Indian Flutter developers.