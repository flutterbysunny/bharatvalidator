# 🇮🇳 BharatValidator

**India-first Flutter form validation package.**

Validate Aadhaar, PAN, GST, IFSC, UPI, Pincode, Phone (+91), Vehicle Number, Passport, Voter ID, Bank Account — with **English, Hindi & Gujarati** error messages.

[![pub package](https://img.shields.io/pub/v/bharatvalidator.svg)](https://pub.dev/packages/bharatvalidator)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

---

## ✨ Features

| Validator | Description |
|---|---|
| `aadhaar` | 12-digit Aadhaar (starts 2–9) |
| `pan` | PAN card (ABCDE1234F format) |
| `gst` | 15-char GST number |
| `ifsc` | Bank IFSC code |
| `upi` | UPI ID (name@handle) |
| `pincode` | 6-digit Indian pincode |
| `phone` | 10-digit mobile (+91 supported) |
| `email` | Email address |
| `vehicle` | Indian vehicle number (GJ01AB1234) |
| `passport` | Indian passport number |
| `voterId` | Voter ID / EPIC number |
| `bankAccount` | Bank account number (9–18 digits) |
| `name` | Name (supports Devanagari & Gujarati script) |
| `password` | Strong password (8+ chars, upper, lower, digit, symbol) |

**Multi-language error messages:** English 🇬🇧 · Hindi 🇮🇳 · Gujarati 🟠

---

## 🚀 Installation

```yaml
dependencies:
  bharatvalidator: ^0.0.1
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
  validator: v.aadhaar,  // Pass directly!
)
```

### Change Language

```dart
// Hindi
final v = BharatValidator(locale: BharatLocale.hindi);

// Gujarati
final v = BharatValidator(locale: BharatLocale.gujarati);
```

### Full Form Example

```dart
final v = BharatValidator(locale: BharatLocale.hindi);

Form(
  key: _formKey,
  child: Column(
    children: [
      TextFormField(validator: v.name,        decoration: InputDecoration(labelText: 'Name')),
      TextFormField(validator: v.phone,       decoration: InputDecoration(labelText: 'Mobile')),
      TextFormField(validator: v.aadhaar,     decoration: InputDecoration(labelText: 'Aadhaar')),
      TextFormField(validator: v.pan,         decoration: InputDecoration(labelText: 'PAN')),
      TextFormField(validator: v.gst,         decoration: InputDecoration(labelText: 'GST')),
      TextFormField(validator: v.ifsc,        decoration: InputDecoration(labelText: 'IFSC')),
      TextFormField(validator: v.upi,         decoration: InputDecoration(labelText: 'UPI ID')),
      TextFormField(validator: v.pincode,     decoration: InputDecoration(labelText: 'Pincode')),
      TextFormField(validator: v.vehicle,     decoration: InputDecoration(labelText: 'Vehicle No.')),
      TextFormField(validator: v.passport,    decoration: InputDecoration(labelText: 'Passport')),
      TextFormField(validator: v.voterId,     decoration: InputDecoration(labelText: 'Voter ID')),
      TextFormField(validator: v.bankAccount, decoration: InputDecoration(labelText: 'Account No.')),
      TextFormField(validator: v.password,    decoration: InputDecoration(labelText: 'Password')),
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
│   ├── bharatvalidator.dart          # Main export
│   └── src/
│       ├── bharat_validator.dart     # Main BharatValidator class
│       ├── locale/
│       │   └── bharat_locale.dart    # Multi-language messages
│       └── validators/
│           ├── aadhaar_validator.dart
│           ├── pan_validator.dart
│           ├── gst_validator.dart
│           ├── ifsc_validator.dart
│           ├── upi_validator.dart
│           ├── pincode_validator.dart
│           ├── phone_validator.dart
│           ├── email_validator.dart
│           ├── vehicle_validator.dart
│           ├── passport_validator.dart
│           ├── voter_id_validator.dart
│           ├── bank_account_validator.dart
│           ├── name_validator.dart
│           └── password_validator.dart
├── ios/                              # iOS plugin stub
├── android/                          # Android plugin stub
├── example/                          # Full demo app
└── test/                             # Unit tests
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📄 License

MIT License © 2025 — Made with ❤️ for Indian Flutter developers.