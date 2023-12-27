import 'package:flutter/material.dart';

class TextfieldInput extends StatelessWidget {
  const TextfieldInput({super.key, required this.option});

  final Map<String, dynamic> option;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
              initialValue: option['padrao'],
              decoration: InputDecoration(
                labelText: option['titulo'],
              ),
              maxLength: option['tamanho'] ?? 255,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor insira um valor';
                }
                return null;
              },
            );
  }

}