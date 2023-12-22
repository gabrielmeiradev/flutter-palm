import 'package:flutter/material.dart';
import 'package:playground/components/app_bar.dart';
import 'package:playground/pages/login_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key, required this.title});
  final String title;

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: widget.title),
      body: const LoginForm()
    );
  }
}
