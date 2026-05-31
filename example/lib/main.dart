import 'package:flutter/material.dart';
import 'package:bharatvalidator/bharatvalidator.dart';

void main() => runApp(const BharatValidatorExampleApp());

class BharatValidatorExampleApp extends StatelessWidget {
  const BharatValidatorExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BharatValidator Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF6B00),
          primary: const Color(0xFFFF6B00),
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
      home: const ValidatorDemoPage(),
    );
  }
}

class ValidatorDemoPage extends StatefulWidget {
  const ValidatorDemoPage({super.key});

  @override
  State<ValidatorDemoPage> createState() => _ValidatorDemoPageState();
}

class _ValidatorDemoPageState extends State<ValidatorDemoPage> {
  final _formKey = GlobalKey<FormState>();
  BharatLocale _locale = BharatLocale.english;
  late BharatValidator _v;

  final _name           = TextEditingController();
  final _phone          = TextEditingController();
  final _email          = TextEditingController();
  final _password       = TextEditingController();
  final _username       = TextEditingController();
  final _dob            = TextEditingController();
  final _aadhaar        = TextEditingController();
  final _pan            = TextEditingController();
  final _voterId        = TextEditingController();
  final _passport       = TextEditingController();
  final _drivingLicense = TextEditingController();
  final _gst            = TextEditingController();
  final _tan            = TextEditingController();
  final _cin            = TextEditingController();
  final _fssai          = TextEditingController();
  final _udyam          = TextEditingController();
  final _rera           = TextEditingController();
  final _ifsc           = TextEditingController();
  final _upi            = TextEditingController();
  final _bankAccount    = TextEditingController();
  final _cardNumber     = TextEditingController();
  final _micr           = TextEditingController();
  final _epf            = TextEditingController();
  final _amount         = TextEditingController();
  final _landline       = TextEditingController();
  final _abha           = TextEditingController();
  final _pincode        = TextEditingController();
  final _vehicle        = TextEditingController();
  final _url            = TextEditingController();
  final _otp            = TextEditingController();

  @override
  void initState() {
    super.initState();
    _v = BharatValidator(locale: _locale);
  }

  void _changeLocale(BharatLocale locale) {
    setState(() {
      _locale = locale;
      _v = BharatValidator(locale: locale);
    });
  }

  @override
  void dispose() {
    for (final c in [
      _name, _phone, _email, _password, _username, _dob,
      _aadhaar, _pan, _voterId, _passport, _drivingLicense,
      _gst, _tan, _cin, _fssai, _udyam, _rera,
      _ifsc, _upi, _bankAccount, _cardNumber, _micr, _epf, _amount,
      _landline, _abha, _pincode, _vehicle, _url, _otp,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🇮🇳 BharatValidator Demo'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          PopupMenuButton<BharatLocale>(
            icon: const Icon(Icons.language),
            tooltip: 'Change Language',
            onSelected: _changeLocale,
            itemBuilder: (_) => const [
              PopupMenuItem(value: BharatLocale.english,  child: Text('🇬🇧 English')),
              PopupMenuItem(value: BharatLocale.hindi,    child: Text('🇮🇳 Hindi')),
              PopupMenuItem(value: BharatLocale.gujarati, child: Text('🟠 Gujarati')),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _SectionHeader('👤 Personal Info'),
              _field('Full Name',     _name,     _v.name,     hint: 'Rahul Sharma'),
              _field('Username',      _username, _v.username, hint: 'rahul_123'),
              _field('Mobile Number', _phone,    _v.phone,    hint: '9876543210', keyboard: TextInputType.phone),
              _field('Landline',      _landline, _v.landline, hint: '02212345678', keyboard: TextInputType.phone),
              _field('Email',         _email,    _v.email,    hint: 'rahul@gmail.com', keyboard: TextInputType.emailAddress),
              _field('Password',      _password, _v.password, hint: 'Min 8 chars, A-z, 0-9, symbol', obscure: true),
              _field('Date of Birth', _dob,      (v) => _v.dob(v, minAge: 18), hint: 'DD/MM/YYYY'),

              const SizedBox(height: 16),
              const _SectionHeader('🪪 Government IDs'),
              _field('Aadhaar Number',  _aadhaar,        _v.aadhaar,        hint: '2345 6789 0123', keyboard: TextInputType.number),
              _field('PAN Number',      _pan,            _v.pan,            hint: 'ABCDE1234F'),
              _field('Voter ID',        _voterId,        _v.voterId,        hint: 'ABC1234567'),
              _field('Passport Number', _passport,       _v.passport,       hint: 'A1234567'),
              _field('Driving License', _drivingLicense, _v.drivingLicense, hint: 'GJ0120200123456'),

              const SizedBox(height: 16),
              const _SectionHeader('🏢 Tax & Business'),
              _field('GST Number',    _gst,   _v.gst,   hint: '27AAPFU0939F1ZV'),
              _field('TAN Number',    _tan,   _v.tan,   hint: 'PDES03028F'),
              _field('CIN Number',    _cin,   _v.cin,   hint: 'U67190TN2014PTC096978'),
              _field('FSSAI License', _fssai, _v.fssai, hint: '12345678901234', keyboard: TextInputType.number),
              _field('Udyam Number',  _udyam, _v.udyam, hint: 'UDYAM-MH-01-0012345'),
              _field('RERA Number',   _rera,  _v.rera,  hint: 'UPRERAPRJ123456'),

              const SizedBox(height: 16),
              const _SectionHeader('🏦 Banking & Finance'),
              _field('IFSC Code',        _ifsc,        _v.ifsc,        hint: 'SBIN0001234'),
              _field('UPI ID',           _upi,         _v.upi,         hint: 'name@paytm'),
              _field('Bank Account No.', _bankAccount, _v.bankAccount, hint: '1234567890', keyboard: TextInputType.number),
              _field('Card Number',      _cardNumber,  _v.cardNumber,  hint: '4111 1111 1111 1111', keyboard: TextInputType.number),
              _field('MICR Code',        _micr,        _v.micr,        hint: '400002009', keyboard: TextInputType.number),
              _field('EPF Account No.',  _epf,         _v.epf,         hint: 'MH/BAN/0012345/000/0001234'),
              _field('Amount (₹)',       _amount,      (v) => _v.amount(v, min: 1, max: 1000000), hint: '5000', keyboard: TextInputType.number),

              const SizedBox(height: 16),
              const _SectionHeader('🏥 Health'),
              _field('ABHA Number', _abha, _v.abha, hint: '12345678901234 or name@abdm'),

              const SizedBox(height: 16),
              const _SectionHeader('📍 Address & Vehicle'),
              _field('Pincode',        _pincode, _v.pincode, hint: '380001', keyboard: TextInputType.number),
              _field('Vehicle Number', _vehicle, _v.vehicle, hint: 'GJ01AB1234'),

              const SizedBox(height: 16),
              const _SectionHeader('🌐 Digital'),
              _field('Website URL',   _url, _v.url,                    hint: 'https://example.com', keyboard: TextInputType.url),
              _field('OTP (6-digit)', _otp, (v) => _v.otp(v, length: 6), hint: '123456', keyboard: TextInputType.number),

              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('✅ All validations passed!'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                icon: const Icon(Icons.check_circle_outline),
                label: const Text('Validate All Fields', style: TextStyle(fontSize: 16)),
                style: FilledButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
      String label,
      TextEditingController controller,
      String? Function(String?) validator, {
        String? hint,
        bool obscure = false,
        TextInputType keyboard = TextInputType.text,
      }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: validator,
        obscureText: obscure,
        keyboardType: keyboard,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}