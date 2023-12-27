import 'package:flutter/material.dart';

class Setup extends ChangeNotifier {
  final String name;
  final String userID;
  final String endpoint;
  final String token;
  final String restVersion;
  final Map<String,dynamic> menu;

  Setup({required this.name, required this.userID, required this.endpoint, required this.token, required this.menu, required this.restVersion});

  factory Setup.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userID': String userID,
        'name': String name,
        'endpoint': String endpoint,
        'Token': String token,
        'MenuV2': Map<String,dynamic> menu,
        'RESTVersion': String restVersion 
      } =>
        Setup(
          userID: userID,
          name: name,
          endpoint: endpoint,
          token: token,
          menu: menu,
          restVersion: restVersion
        ),
      _ => throw const FormatException('Falha ao carregar usuário.'),
    };
  }
}