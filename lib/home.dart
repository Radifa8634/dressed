import 'package:flutter/material.dart';

const kprimaryColor = Colors.indigo;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to Dressed!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: kprimaryColor,
          ),
        ),
      ),
    );
  }
}
