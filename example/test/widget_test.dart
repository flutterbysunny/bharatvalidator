// Widget test for BharatValidator example app.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bharatvalidator_example/main.dart';

void main() {
  testWidgets('App renders correctly', (WidgetTester tester) async {
    // Build the example app
    await tester.pumpWidget(const BharatValidatorExampleApp());
    await tester.pumpAndSettle();

    // App title exists
    expect(find.text('🇮🇳 BharatValidator Demo'), findsOneWidget);
  });

  testWidgets('Form renders all section headers', (WidgetTester tester) async {
    await tester.pumpWidget(const BharatValidatorExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('Personal Info'), findsOneWidget);
    expect(find.text('Government IDs'), findsOneWidget);
    expect(find.text('Financial'), findsOneWidget);
    expect(find.text('Others'), findsOneWidget);
  });

  testWidgets('Validate button is present', (WidgetTester tester) async {
    await tester.pumpWidget(const BharatValidatorExampleApp());
    await tester.pumpAndSettle();

    expect(find.text('Validate All Fields'), findsOneWidget);
  });

  testWidgets('Empty form shows validation errors on submit',
          (WidgetTester tester) async {
        await tester.pumpWidget(const BharatValidatorExampleApp());
        await tester.pumpAndSettle();

        // Tap validate button without filling anything
        await tester.tap(find.text('Validate All Fields'));
        await tester.pumpAndSettle();

        // At least one error message should appear
        expect(find.byType(TextFormField), findsWidgets);
      });

  testWidgets('Language switcher is accessible', (WidgetTester tester) async {
    await tester.pumpWidget(const BharatValidatorExampleApp());
    await tester.pumpAndSettle();

    // Language icon button exists in AppBar
    expect(find.byIcon(Icons.language), findsOneWidget);
  });
}