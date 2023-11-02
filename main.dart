import 'package:flutter/material.dart';
import './screens/home_screen.dart';

void main() {
  runApp(
    const myapp(),
  );
}

class myapp extends StatelessWidget {
  const myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
