import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:bharatvalidator/bharatvalidator.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // ✅ FIX: Pure Dart package hai — Bharatvalidator() aur getPlatformVersion() nahi hai.
  //         BharatValidator() use karo aur seedha validators test karo.

  final v = BharatValidator();

  testWidgets('Aadhaar validator test', (WidgetTester tester) async {
    expect(v.aadhaar('234567890123'), isNull);
    expect(v.aadhaar(''), isNotNull);
  });

  testWidgets('PAN validator test', (WidgetTester tester) async {
    expect(v.pan('ABCDE1234F'), isNull);
    expect(v.pan('INVALID'), isNotNull);
  });

  testWidgets('Phone validator test', (WidgetTester tester) async {
    expect(v.phone('9876543210'), isNull);
    expect(v.phone('+919876543210'), isNull);
    expect(v.phone(''), isNotNull);
  });

  testWidgets('GST validator test', (WidgetTester tester) async {
    expect(v.gst('27AAPFU0939F1ZV'), isNull);
    expect(v.gst('INVALIDGST'), isNotNull);
  });

  testWidgets('UPI validator test', (WidgetTester tester) async {
    expect(v.upi('name@paytm'), isNull);
    expect(v.upi('nouri'), isNotNull);
  });

  testWidgets('Hindi error messages work', (WidgetTester tester) async {
    final hindi = BharatValidator(locale: BharatLocale.hindi);
    expect(hindi.aadhaar(''), contains('आधार'));
  });

  testWidgets('Gujarati error messages work', (WidgetTester tester) async {
    final guj = BharatValidator(locale: BharatLocale.gujarati);
    expect(guj.phone(''), contains('ફોન'));
  });
}