import 'package:flutter/material.dart';
import 'package:playground/pages/components/app_bar.dart';
import 'package:playground/pages/components/my_bottom_bar.dart';
import 'package:playground/widget_converter/widget_converter.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({super.key, required this.option});

  final Map<String, dynamic> option;

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  late List<Widget> camposContainer;

  @override
  void initState() {
    super.initState();

    List<Map<String, dynamic>> campos = ((widget.option['campos'] ?? []) as List).map<Map<String, dynamic>>((e) => Map<String,dynamic>.from(e)).toList();
    camposContainer = campos.map(WidgetConverter.fromJson).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            title: widget.option['cabecalho'] ?? widget.option['Title'] ?? "Null Title"),
        body: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: camposContainer,
          ),
        ),
        bottomNavigationBar: const MyBottomBar());
  }
}
