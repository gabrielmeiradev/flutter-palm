import 'package:flutter/material.dart';
import 'package:playground/components/app_bar.dart';
import 'package:playground/services/widget_converter.dart';

class OptionPage extends StatelessWidget {
  const OptionPage({super.key, required this.option});

  final Map<String, dynamic> option;

  @override
  Widget build(BuildContext context) {  
    var campos = option['campos'] ?? List;

    List<Widget> camposContainer = [];

    campos.forEach((campo) {
      camposContainer.add(widgetConverter(campo));
    });

    return Scaffold(
      appBar: MyAppBar(title: option['cabecalho'] ?? option['Title']),
      body:  Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          // crossAxisCount: 2,
          // crossAxisSpacing: 10,
          children: camposContainer  
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          
          child: IconTheme(
            data: IconThemeData(color: Theme.of(context).colorScheme.onBackground),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  tooltip: 'Voltar',
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                   Navigator.of(context).pop();
                  },
                ),
                IconButton(
                  tooltip: 'Procurar',
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        )
      );
  }
}
