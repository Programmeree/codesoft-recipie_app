import 'package:flutter/material.dart';

class CoffeeDetailsPage extends StatelessWidget {
  final String coffeeType;

  CoffeeDetailsPage({required this.coffeeType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coffeeType),
      ),
      body: Center(
        child: Text('Details for $coffeeType'),
      ),
    );
  }
}
