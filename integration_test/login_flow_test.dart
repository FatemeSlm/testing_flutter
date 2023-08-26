import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:unit_widget_integration_test_sample/login/login_screen.dart';

void main() {
  group('login flow test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets(
        'should show home screen after user tap on login '
        'button after entering valid user name and password',
        (WidgetTester tester) async{
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
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 2));

      Finder homeText = find.byKey(const ValueKey('welcome'));
      await tester.pump(const Duration(seconds: 5));

      // assert
      expect(homeText, findsOneWidget);
    });
  });
}
