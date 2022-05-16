import 'package:boilerplate/resources/app_colors.dart';
import 'package:flutter/material.dart';

class HomeFollowUp extends StatelessWidget {
  const HomeFollowUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Second Screen"),
        leading: TextButton(
          child: Text("Back", style: TextStyle(color: AppColors.white)),
          onPressed: () {
            print("Back action");
          },
        ),
      ),
      body: const Center(
        child: Text("Second screen", style: TextStyle(color: AppColors.white))
      ),
    );
  }
}