import 'package:comeback/Home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Comeback());
}

class Comeback extends StatelessWidget {
  const Comeback({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
