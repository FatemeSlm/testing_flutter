import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:unit_widget_integration_test_sample/screens/login/login_screen.dart';
import 'package:unit_widget_integration_test_sample/screens/news/news_chnage_notifier.dart';
import 'package:unit_widget_integration_test_sample/service/news_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
          create: (_) => NewsChangeNotifier(NewsService()),
          child: const LoginScreen()),
    );
  }
}
