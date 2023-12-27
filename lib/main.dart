import 'package:flutter/material.dart';
import 'package:playground/pages/app_page.dart';
import 'package:playground/providers/authentication.dart';
import 'package:provider/provider.dart';

void main() {
   runApp(
    ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autenticação Palm',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AppPage(title: 'Autenticação Palm'),
    );
  }
}
