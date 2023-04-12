import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Container(
            width: 400,
            height: 100,
            color: Colors.blue,
          ),
          Container(
            width: double.infinity,
            height: 100,
            color: Colors.green,
          ),
        ],
      ),
    ));
  }
}
