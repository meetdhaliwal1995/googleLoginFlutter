import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class SampleScreen extends StatelessWidget {
  const SampleScreen({super.key});

  String onPressedBtn() {
    return "dddddd";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sample Scrren"),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const Text("data"),
          ElevatedButton(child: const Text("Sample Scrren"), onPressed: () {}),
          ElevatedButton(child: const Text("Sample Scrren"), onPressed: () {}),
          ElevatedButton(child: const Text("Sample Scrren"), onPressed: () {})
        ],
      )),
    );
  }
}
