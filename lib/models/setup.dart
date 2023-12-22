import 'package:flutter/material.dart';

class Setup extends ChangeNotifier {
  final String name;
  final String userID;

  Setup({required this.name, required this.userID});

  factory Setup.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userID': String userID,
        'name': String name,
      } =>
        Setup(
          userID: userID,
          name: name
        ),
      _ => throw const FormatException('Falha ao carregar usuário.'),
    };
  }
}