import 'package:flutter/material.dart';

class Setup extends ChangeNotifier {
  final String name;
  final String userID;
  final Map<String,dynamic> menu;

  Setup({required this.name, required this.userID, required this.menu});

  factory Setup.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userID': String userID,
        'name': String name,
        'MenuV2': Map<String,dynamic> menu
      } =>
        Setup(
          userID: userID,
          name: name,
          menu: menu
        ),
      _ => throw const FormatException('Falha ao carregar usuário.'),
    };
  }
}