// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:unit_widget_integration_test_sample/validator.dart';

void main() {
  group('email validator - ', () {
    test('validate for empty email id', () {
      // arrange & act
      var result = Validator.validateEmail('');

      // assert
      expect(result, 'Required Filed');
    });

    test('validate for invalid email id', () {
      // arrange & act
      var result = Validator.validateEmail('abcdefgh');

      // assert
      expect(result, 'Please enter a valid email');
    });

    test('validate for valid email id', () {
      // arrange & act
      var result = Validator.validateEmail('abc@gmail.com');

      // assert
      expect(result, null);
    });
  });

  group('password validator', () {
    test('validate for empty password', () {
      // arrange & act
      var result = Validator.validatePassword('');

      // assert
      expect(result, 'Required Filed');
    });

    test('validate for invalid password', () {
      // arrange & act
      var result = Validator.validatePassword('abc');

      // assert
      expect(result, 'Please Enter at least 8 character for password');
    });

    test('validate for valid password', () {
      // arrange & act
      var result = Validator.validatePassword('password');

      // assert
      expect(result, null);
    });
  });
}
