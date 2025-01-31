import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/login_screen.dart';

void main() {
  testWidgets('Login form should show success for correct credentials',
      (WidgetTester tester) async {
    // Build the LoginScreen widget.
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    // Find widgets by key.
    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.byKey(const Key('loginButton'));

    // Enter valid email and password.
    await tester.enterText(emailField, 'test@example.com');
    await tester.enterText(passwordField, 'password123');

    // Tap the login button.
    await tester.tap(loginButton);

    // Rebuild the widget after the state change.
    await tester.pump();

    // Check for success message.
    expect(find.text('Login Successful'), findsOneWidget);
  });

  testWidgets('Login form should show failure for incorrect credentials',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: LoginScreen()));

    final emailField = find.byKey(const Key('emailField'));
    final passwordField = find.byKey(const Key('passwordField'));
    final loginButton = find.byKey(const Key('loginButton'));

    await tester.enterText(emailField, 'wrong@example.com');
    await tester.enterText(passwordField, 'wrongpassword');

    await tester.tap(loginButton);
    await tester.pump();

    expect(find.text('Login Failed'), findsOneWidget);
  });
}
