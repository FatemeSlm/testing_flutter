import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_widget_integration_test_sample/screens/login/login_screen.dart';

void main() {
  group('login flow test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'should show required filed message after user taps on login button '
        'without entering user email and password', (tester) async {
      //arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      // act
      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder errorMassages = find.text('Required Filed');

      //assert
      expect(errorMassages, findsNWidgets(2));
    });

    testWidgets(
        'should show invalid email error message after user taps on login'
        'button after entering an invalid email', (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      // act
      Finder emailTextField = find.byKey(const ValueKey('emailId'));
      await tester.enterText(emailTextField, 'abcdef');
      await tester.pump(const Duration(seconds: 2));

      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder invalidEmailText = find.text('Please enter a valid email');
      await tester.pump(const Duration(seconds: 2));

      // assert
      expect(invalidEmailText, findsOneWidget);
    });

    testWidgets(
        'should show invalid password error message after user taps on login '
        'button after entering an invalid password',
        (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      // act
      Finder passwordTextField = find.byKey(const ValueKey('password'));
      await tester.enterText(passwordTextField, 'abc');
      await tester.pump(const Duration(seconds: 2));

      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder invalidPasswordText =
          find.text('Please Enter at least 8 character for password');
      await tester.pump(const Duration(seconds: 2));

      // assert
      expect(invalidPasswordText, findsOneWidget);
    });

    testWidgets(
        'should show home screen after user taps on login '
        'button after entering valid user email and password',
        (WidgetTester tester) async {
      //arrange
      await tester.pumpWidget(const MaterialApp(
        home: LoginScreen(),
      ));

      // act
      Finder emailTextField = find.byKey(const ValueKey('emailId'));
      await tester.enterText(emailTextField, 'abc@gmail.com');
      await tester.pump(const Duration(seconds: 2));

      Finder passwordTextField = find.byKey(const ValueKey('password'));
      await tester.enterText(passwordTextField, 'password');
      await tester.pump(const Duration(seconds: 2));

      Finder loginButton = find.byType(ElevatedButton);
      await tester.tap(loginButton);
      await tester.pumpAndSettle(const Duration(seconds: 2));

      Finder text = find.text('News');
      await tester.pump(const Duration(seconds: 2));

      // assert
      expect(text, findsOneWidget);
    });
  });
}
