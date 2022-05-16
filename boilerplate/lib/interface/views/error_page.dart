import 'package:flutter/material.dart';

import '../../resources/app_strings.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(""),
      ),
      body: Center(
        child: Text(
          AppStrings.error.router,
          style: const TextStyle(color: Colors.black),
        ),
      ));
  }
}