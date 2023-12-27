import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: IconTheme(
        data: IconThemeData(
            color: Theme.of(context).colorScheme.onBackground),
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
    );
  }
}
