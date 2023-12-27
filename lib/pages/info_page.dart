import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:playground/components/app_bar.dart';
import 'package:playground/main.dart';
import 'package:playground/pages/option_page.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var setup = Provider.of<Authentication>(context).setup;
    var menu = setup.menu;
    var token = setup.token;
    var userID = setup.userID;
    List<Widget> menuWidget = [];
    var endpoint = setup.endpoint;

    menu.forEach((category, value) {
      var options = value['items'];
      List<Widget> optionsWidget = [];

      options.forEach((option, desc) {
        optionsWidget.add(
          ListTile(
            title: Text(option),
              onTap: () async {
                // TODO: go to dynamic page
                String api = desc['api'];
                // if(setup.restVersion != "1") {
                  api = api.split("/").last;
                // }
                var url = "http://" + endpoint + "/" + api;
                http.get(Uri.parse(url), 
                headers: <String, String>{
                  "Token": token, 
                  "userID": userID, 
                  "charset": "utf-8",
                  "Content-Type": "application/json",
                  "content-language": "pt-BR"
                })
                .then((response) {
                  var optionFromApi = jsonDecode(response.body) as Map<String, dynamic>;
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OptionPage(option: optionFromApi),
                            ),
                          );
                });
               
              }
        ),
        );
      });

      menuWidget.add(
        ExpansionTile(
          title: Text(category),
          children: optionsWidget,
        )
      );
    });
    
    return Scaffold(
      appBar: const MyAppBar(title: 'Tela de usuário'),
      body:  const Text("teste"),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: menuWidget,
          ),
        ),
      );
  }
}
