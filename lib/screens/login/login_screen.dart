import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:unit_widget_integration_test_sample/validator.dart';

import '../news/news_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                key: const ValueKey('emailId'),
                decoration: const InputDecoration(hintText: 'Enter Email id'),
                validator: (value) => Validator.validateEmail(value ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: passwordController,
                key: const ValueKey('password'),
                decoration: const InputDecoration(hintText: 'Enter Password'),
                validator: (value) => Validator.validatePassword(value ?? ''),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NewsScreen(),
                      ));
                    }
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
