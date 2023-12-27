import 'package:flutter/material.dart';
import 'package:playground/models/setup.dart';

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