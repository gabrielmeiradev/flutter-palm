import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:playground/core/app_constants.dart';
import 'package:playground/pages/info_page.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import '../models/setup.dart';
import '../providers/authentication.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

Future<Setup> createSetup(String usuario, String senha, String alias) async {
  final url =
      '${AppConstants.authUrl}applogin?usuario=$usuario&senha=$senha&alias=$alias';
  final response = await http.post(Uri.parse(url));

  if (response.statusCode == 201) {
    Setup setup =
        Setup.fromJson(jsonDecode(utf8.decode(response.bodyBytes)) as Map<String, dynamic>);

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
                  //     createSetup("humberto.gunzi", "123456", "sumi-intra")
                  // .then((value) {
                  // Provider.of<Authentication>(context, listen: false).setup = value;
                  
                  // Navigator.pushReplacement(context,
                  //     MaterialPageRoute(builder: (context) => const InfoPage()));
                  // });

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
                  Provider.of<Authentication>(context, listen: false).setup = value;
                  
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => const InfoPage()));
                  });
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
