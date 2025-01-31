import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/contact_screen.dart';
// Import your main.dart file

void main() {
  testWidgets('Contact Form UI - Submit button test',
      (WidgetTester tester) async {
    // Build the ContactForm widget
    await tester.pumpWidget(const MaterialApp(home: ContactForm()));

    // Find the text fields and submit button
    final nameField = find.byType(TextField).first;
    final emailField = find.byType(TextField).at(1);
    final messageField = find.byType(TextField).at(2);
    final submitButton = find.text('Submit');

    // Verify if the text fields are present
    expect(nameField, findsOneWidget);
    expect(emailField, findsOneWidget);
    expect(messageField, findsOneWidget);

    // Verify if the submit button is present
    expect(submitButton, findsOneWidget);

    // Enter text into the fields
    await tester.enterText(nameField, 'John Doe');
    await tester.enterText(emailField, 'john.doe@example.com');
    await tester.enterText(
        messageField, 'Hello! I would like to inquire about...');

    // Tap the submit button
    await tester.tap(submitButton);
    await tester.pump();
  });
}
