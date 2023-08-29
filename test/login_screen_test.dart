import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget_integration_test_sample/screens/login/login_screen.dart';

void main() {
  testWidgets('should have a title', (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder titleText = find.text('Login Screen');

    // assert
    expect(titleText, findsOneWidget);
  });

  testWidgets('should have a text form filed to collect user email',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder userNameTextFiled = find.byKey(const ValueKey('emailId'));

    // assert
    expect(userNameTextFiled, findsOneWidget);
  });

  testWidgets('should have a text form filed to collect user password',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder passwordTextFiled = find.byKey(const ValueKey('password'));

    // assert
    expect(passwordTextFiled, findsOneWidget);
  });

  testWidgets('should have a login button', (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder loginButton = find.byType(ElevatedButton);

    // assert
    expect(loginButton, findsOneWidget);
  });

  testWidgets(
      'should show Required Field error messages if user email and password is empty',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder errorTexts = find.text('Required Filed');

    // assert
    expect(errorTexts, findsNWidgets(2));
  });

  testWidgets(
      'should show invalid email error message if user email is invalid',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder emailTextField = find.byKey(const ValueKey('emailId'));
    await tester.enterText(emailTextField, 'hjdfghg');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder emailInvalidText = find.text('Please enter a valid email');

    // assert
    expect(emailInvalidText, findsOneWidget);
  });

  testWidgets(
      'should show invalid password error message if user password is invalid',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder passwordTextField = find.byKey(const ValueKey('password'));
    await tester.enterText(passwordTextField, '1234');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder passwordInvalidText =
        find.text('Please Enter at least 8 character for password');

    // assert
    expect(passwordInvalidText, findsOneWidget);
  });

  testWidgets('should submit form if user email and password is valid',
      (WidgetTester tester) async {
    //arrange
    await tester.pumpWidget(const MaterialApp(
      home: LoginScreen(),
    ));

    // act
    Finder passwordTextField = find.byKey(const ValueKey('password'));
    await tester.enterText(passwordTextField, 'password');
    Finder emailTextField = find.byKey(const ValueKey('emailId'));
    await tester.enterText(emailTextField, 'abc@gmail.com');

    Finder loginButton = find.byType(ElevatedButton);
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    Finder errorTexts = find.text('Required Filed');

    // assert
    expect(errorTexts, findsNothing);
  });
}
