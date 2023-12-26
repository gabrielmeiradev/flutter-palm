import 'package:flutter/material.dart';
import 'package:playground/components/app_bar.dart';
import 'package:playground/main.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var setup = Provider.of<Authentication>(context).setup;
    var menu = setup.menu;
    List<Widget> menuWidget = [];

    menu.keys.forEach((category) {
      var options = menu[category]['items'];
      List<Widget> optionsWidget = [];

      options.keys.forEach((option) {
        optionsWidget.add(
          ListTile(title: Text(option)),
        );
      });

      menuWidget.add(
        ExpansionTile(
          title: Text(category),
          children: optionsWidget
        )
      );
    });
    
    return Scaffold(
      appBar: const MyAppBar(title: 'Tela de usuário'),
      body:  Text("teste"),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: menuWidget,
          ),
        ),
      );
  }
}
