import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

// ── Data Model ───────────────────────────────────────────────────────────────
class _ValidatorItem {
  final String label;
  final String hint;
  final String category;
  final TextInputType keyboard;
  final bool obscure;
  final String? Function(String?) validator;

  const _ValidatorItem({
    required this.label,
    required this.hint,
    required this.category,
    required this.validator,
    this.keyboard = TextInputType.text,
    this.obscure = false,
  });
}

// ── Main Page ────────────────────────────────────────────────────────────────
class ValidatorDemoPage extends StatefulWidget {
  const ValidatorDemoPage({super.key});

  @override
  State<ValidatorDemoPage> createState() => _ValidatorDemoPageState();
}

class _ValidatorDemoPageState extends State<ValidatorDemoPage> {
  final _formKey       = GlobalKey<FormState>();
  final _searchCtrl    = TextEditingController();
  BharatLocale _locale = BharatLocale.english;
  late BharatValidator _v;
  String _searchQuery  = '';
  bool _showSearch     = false;

  // Controllers map
  final Map<String, TextEditingController> _controllers = {};

  late List<_ValidatorItem> _allItems;

  @override
  void initState() {
    super.initState();
    _v = BharatValidator(locale: _locale);
    _buildItems();
  }

  void _buildItems() {
    _allItems = [
      // 👤 Personal Info
      _ValidatorItem(label: 'Full Name',     hint: 'Rahul Sharma',              category: '👤 Personal Info',       validator: _v.name),
      _ValidatorItem(label: 'Username',      hint: 'rahul_123',                 category: '👤 Personal Info',       validator: _v.username),
      _ValidatorItem(label: 'Mobile Number', hint: '9876543210',                category: '👤 Personal Info',       validator: _v.phone,    keyboard: TextInputType.phone),
      _ValidatorItem(label: 'Landline',      hint: '02212345678',               category: '👤 Personal Info',       validator: _v.landline, keyboard: TextInputType.phone),
      _ValidatorItem(label: 'Email',         hint: 'rahul@gmail.com',           category: '👤 Personal Info',       validator: _v.email,    keyboard: TextInputType.emailAddress),
      _ValidatorItem(label: 'Password',      hint: 'Min 8 chars, A-z, 0-9, @', category: '👤 Personal Info',       validator: _v.password, obscure: true),
      _ValidatorItem(label: 'Date of Birth', hint: 'DD/MM/YYYY',               category: '👤 Personal Info',       validator: (v) => _v.dob(v, minAge: 18)),

      // 🪪 Government IDs
      _ValidatorItem(label: 'Aadhaar Number',  hint: '2345 6789 0123',   category: '🪪 Government IDs', validator: _v.aadhaar,        keyboard: TextInputType.number),
      _ValidatorItem(label: 'PAN Number',      hint: 'ABCDE1234F',       category: '🪪 Government IDs', validator: _v.pan),
      _ValidatorItem(label: 'Voter ID',        hint: 'ABC1234567',       category: '🪪 Government IDs', validator: _v.voterId),
      _ValidatorItem(label: 'Passport',        hint: 'A1234567',         category: '🪪 Government IDs', validator: _v.passport),
      _ValidatorItem(label: 'Driving License', hint: 'GJ0120200123456',  category: '🪪 Government IDs', validator: _v.drivingLicense),
      _ValidatorItem(label: 'Ration Card',     hint: 'GJ123456789012',   category: '🪪 Government IDs', validator: _v.rationCard),

      // 🏢 Tax & Business
      _ValidatorItem(label: 'GST Number',    hint: '27AAPFU0939F1ZV',      category: '🏢 Tax & Business', validator: _v.gst),
      _ValidatorItem(label: 'TAN Number',    hint: 'PDES03028F',           category: '🏢 Tax & Business', validator: _v.tan),
      _ValidatorItem(label: 'CIN Number',    hint: 'U67190TN2014PTC096978',category: '🏢 Tax & Business', validator: _v.cin),
      _ValidatorItem(label: 'FSSAI License', hint: '12345678901234',       category: '🏢 Tax & Business', validator: _v.fssai,  keyboard: TextInputType.number),
      _ValidatorItem(label: 'Udyam Number',  hint: 'UDYAM-MH-01-0012345', category: '🏢 Tax & Business', validator: _v.udyam),
      _ValidatorItem(label: 'RERA Number',   hint: 'UPRERAPRJ123456',      category: '🏢 Tax & Business', validator: _v.rera),

      // 🏦 Banking & Finance
      _ValidatorItem(label: 'IFSC Code',        hint: 'SBIN0001234',            category: '🏦 Banking & Finance', validator: _v.ifsc),
      _ValidatorItem(label: 'UPI ID',           hint: 'name@paytm',             category: '🏦 Banking & Finance', validator: _v.upi),
      _ValidatorItem(label: 'Bank Account',     hint: '1234567890',             category: '🏦 Banking & Finance', validator: _v.bankAccount,  keyboard: TextInputType.number),
      _ValidatorItem(label: 'Card Number',      hint: '4111 1111 1111 1111',    category: '🏦 Banking & Finance', validator: _v.cardNumber,   keyboard: TextInputType.number),
      _ValidatorItem(label: 'MICR Code',        hint: '400002009',              category: '🏦 Banking & Finance', validator: _v.micr,         keyboard: TextInputType.number),
      _ValidatorItem(label: 'EPF Account',      hint: 'MH/BAN/0012345/000/001', category: '🏦 Banking & Finance', validator: _v.epf),
      _ValidatorItem(label: 'SWIFT/BIC Code',   hint: 'SBININBB',               category: '🏦 Banking & Finance', validator: _v.swift),
      _ValidatorItem(label: 'Amount (₹)',        hint: '5000',                   category: '🏦 Banking & Finance', validator: (v) => _v.amount(v, min: 1, max: 1000000), keyboard: TextInputType.number),

      // 🏥 Health
      _ValidatorItem(label: 'ABHA Number', hint: '12345678901234 or name@abdm', category: '🏥 Health', validator: _v.abha),

      // 📍 Address & Vehicle
      _ValidatorItem(label: 'Pincode',        hint: '380001',     category: '📍 Address & Vehicle', validator: _v.pincode, keyboard: TextInputType.number),
      _ValidatorItem(label: 'Vehicle Number', hint: 'GJ01AB1234', category: '📍 Address & Vehicle', validator: _v.vehicle),

      // 📞 Others
      _ValidatorItem(label: 'Toll-free Number', hint: '1800-123-4567', category: '📞 Others', validator: _v.tollFree, keyboard: TextInputType.phone),
      _ValidatorItem(label: 'Website URL',      hint: 'https://example.com', category: '📞 Others', validator: _v.url, keyboard: TextInputType.url),
      _ValidatorItem(label: 'OTP (6-digit)',    hint: '123456',              category: '📞 Others', validator: (v) => _v.otp(v, length: 6), keyboard: TextInputType.number),
    ];

    // Init controllers
    for (final item in _allItems) {
      _controllers.putIfAbsent(item.label, () => TextEditingController());
    }
  }

  void _changeLocale(BharatLocale locale) {
    setState(() {
      _locale = locale;
      _v = BharatValidator(locale: locale);
      _buildItems();
    });
  }

  List<_ValidatorItem> get _filteredItems {
    if (_searchQuery.isEmpty) return _allItems;
    return _allItems.where((item) =>
    item.label.toLowerCase().contains(_searchQuery.toLowerCase()) ||
        item.category.toLowerCase().contains(_searchQuery.toLowerCase())
    ).toList();
  }

  Map<String, List<_ValidatorItem>> get _groupedItems {
    final map = <String, List<_ValidatorItem>>{};
    for (final item in _filteredItems) {
      map.putIfAbsent(item.category, () => []).add(item);
    }
    return map;
  }

  @override
  void dispose() {
    _searchCtrl.dispose();
    for (final c in _controllers.values) c.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showSearch
            ? TextField(
          controller: _searchCtrl,
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search validators...',
            hintStyle: TextStyle(color: Colors.white70),
            border: InputBorder.none,
          ),
          onChanged: (v) => setState(() => _searchQuery = v),
        )
            : const Text('🇮🇳 BharatValidator Demo'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(_showSearch ? Icons.close : Icons.search),
            onPressed: () {
              setState(() {
                _showSearch = !_showSearch;
                if (!_showSearch) {
                  _searchCtrl.clear();
                  _searchQuery = '';
                }
              });
            },
          ),
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
      body: Column(
        children: [
          // Stats bar
          Container(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.verified, size: 16, color: Color(0xFFFF6B00)),
                const SizedBox(width: 6),
                Text(
                  '${_filteredItems.length} validators • 3 languages',
                  style: TextStyle(
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  ..._groupedItems.entries.map((entry) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionHeader(entry.key),
                      ...entry.value.map((item) => _ValidatorField(
                        item: item,
                        controller: _controllers[item.label]!,
                      )),
                      const SizedBox(height: 8),
                    ],
                  )),
                  const SizedBox(height: 16),
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
        ],
      ),
    );
  }
}

// ── Validator Field with Copy Button ─────────────────────────────────────────
class _ValidatorField extends StatelessWidget {
  final _ValidatorItem item;
  final TextEditingController controller;

  const _ValidatorField({required this.item, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        validator: item.validator,
        obscureText: item.obscure,
        keyboardType: item.keyboard,
        decoration: InputDecoration(
          labelText: item.label,
          hintText: item.hint,
          suffixIcon: item.obscure
              ? null
              : IconButton(
            icon: const Icon(Icons.copy, size: 18),
            tooltip: 'Copy hint',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: item.hint));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Copied: ${item.hint}'),
                  duration: const Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

// ── Section Header ────────────────────────────────────────────────────────────
class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, top: 4),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 20,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}