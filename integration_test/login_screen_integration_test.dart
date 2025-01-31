import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertest/login_screen.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('LoginScreen Integration Test', () {
    testWidgets('Successful login scenario', (tester) async {
      // Pump the LoginScreen widget into the widget tree
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Enter correct credentials
      await tester.enterText(
          find.byKey(const Key('emailField')), 'test@example.com');
      await tester.enterText(
          find.byKey(const Key('passwordField')), 'password123');

      // Tap the login button
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      // Verify the "Login Successful" message is shown
      expect(find.text('Login Successful'), findsOneWidget);
    });

    testWidgets('Failed login with incorrect credentials', (tester) async {
      // Pump the LoginScreen widget into the widget tree
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Enter incorrect credentials
      await tester.enterText(
          find.byKey(const Key('emailField')), 'wrong@example.com');
      await tester.enterText(
          find.byKey(const Key('passwordField')), 'wrongpassword');

      // Tap the login button
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      // Verify the "Login Failed" message is shown
      expect(find.text('Login Failed'), findsOneWidget);
    });

    testWidgets('Login attempt with empty fields', (tester) async {
      // Pump the LoginScreen widget into the widget tree
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Leave both fields empty
      await tester.enterText(find.byKey(const Key('emailField')), '');
      await tester.enterText(find.byKey(const Key('passwordField')), '');

      // Tap the login button
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      // Verify the "Login Failed" message is shown (since we expect no credentials entered)
      expect(find.text('Login Failed'), findsOneWidget);
    });

    testWidgets('UI elements are present', (tester) async {
      // Pump the LoginScreen widget into the widget tree
      await tester.pumpWidget(MaterialApp(home: LoginScreen()));

      // Verify the email and password fields are present
      expect(find.byKey(const Key('emailField')), findsOneWidget);
      expect(find.byKey(const Key('passwordField')), findsOneWidget);

      // Verify the login button is present
      expect(find.byKey(const Key('loginButton')), findsOneWidget);
    });
  });
}
