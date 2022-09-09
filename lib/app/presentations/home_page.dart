import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () => Navigator.pushNamed(context, '/detail'),
          child: Text(
            'Home',
          ),
        ),
      ),
    );
  }
}
