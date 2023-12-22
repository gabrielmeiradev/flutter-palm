import 'package:flutter/material.dart';
import 'package:playground/components/app_bar.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(title: 'Tela de usuário',),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text("Olá mundo"),
      ),
    );
  }
  
}
