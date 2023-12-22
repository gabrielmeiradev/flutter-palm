import 'package:flutter/material.dart';
import 'package:playground/models/setup.dart';
import 'package:playground/pages/app_page.dart';
import 'package:provider/provider.dart';


void main() {
   runApp(
    ChangeNotifierProvider(
      create: (context) => Authentication(),
      child: const MyApp(),
    ),
  );
}

class Authentication extends ChangeNotifier{
  Setup? _setup;

  set setup(Setup setup) {
    _setup = setup;
    notifyListeners();
  } 

  Setup get setup {
    if(_setup == null) {
      throw Exception("Não autenticado");
    }

    return _setup!;
  }

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
