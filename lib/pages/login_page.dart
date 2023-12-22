import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:playground/pages/info_page.dart';
import 'dart:convert';
import '../models/setup.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

Future<Setup> createSetup(String usuario, String senha, String alias) async {
  final url =
      'https://server.palmapp.com.br/rest/applogin?usuario=$usuario&senha=$senha&alias=$alias';
  final response = await http.post(Uri.parse(url), headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
  });

  if (response.statusCode == 201) {
    Setup setup =
        Setup.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    return setup;
  } else {
    throw Exception("Erro ao autenticar");
  }
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final usuarioController = TextEditingController();
  final senhaController = TextEditingController();
  final aliasController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: usuarioController,
              decoration: const InputDecoration(
                labelText: 'Insira seu usuário',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira um valor';
                }
                return null;
              },
            ),
            TextFormField(
              controller: senhaController,
              decoration: const InputDecoration(
                labelText: 'Insira sua senha',
              ),
              obscureText: true,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira um valor';
                }
                return null;
              },
            ),
            TextFormField(
              controller: aliasController,
              decoration: const InputDecoration(
                labelText: 'Insira sua empresa (alias)',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira um valor';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () async {
                  createSetup(usuarioController.text, senhaController.text, aliasController.text)
                  .then((value) {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => InfoPage()));
                  });

                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    usuarioController.dispose();
    senhaController.dispose();
    aliasController.dispose();
    super.dispose();
  }
}
